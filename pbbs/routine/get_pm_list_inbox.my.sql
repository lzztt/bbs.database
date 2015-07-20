DROP PROCEDURE IF EXISTS get_pm_list_inbox;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_pm_list_inbox(IN $uid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get recent private messages in inbox for a given user'  
BEGIN
    SELECT g.msg_id, m.body, g.from_uid AS uid,
        (SELECT username FROM users WHERE id = g.from_uid) AS user, 
        g.pm_time AS time, g.has_new AS is_new
    FROM priv_msgs AS m
        JOIN (SELECT msg_id, MAX(time) AS pm_time, from_uid, (SUM(to_status) > COUNT(to_status)) AS has_new FROM priv_msgs WHERE to_uid = $uid AND to_status > 0 GROUP BY msg_id ORDER BY pm_time DESC LIMIT $limit OFFSET $offset) AS g
        ON m.id = g.msg_id
    ORDER BY g.pm_time DESC;
END ;;
DELIMITER ;
