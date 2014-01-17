DROP PROCEDURE IF EXISTS get_pm_list_inbox;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_pm_list_inbox(IN $uid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get recent private messages in inbox for a given user'  
BEGIN
	SELECT m.id, m.from_uid, m.to_uid, m.body, m.time,
		(SELECT username FROM users WHERE id = m.from_uid) AS from_name, 
		(SELECT username FROM users WHERE id = m.to_uid) AS to_name, 
		g.pm_time, g.has_new AS is_new
	FROM priv_msgs AS m
		JOIN (SELECT msg_id, MAX(time) AS pm_time, (SUM(to_status) > COUNT(to_status)) AS has_new FROM priv_msgs WHERE to_uid = $uid AND to_status > 0 GROUP BY msg_id ORDER BY pm_time DESC LIMIT $limit OFFSET $offset) AS g
		ON m.id = g.msg_id
	ORDER BY g.pm_time DESC;
END ;;
DELIMITER ;
