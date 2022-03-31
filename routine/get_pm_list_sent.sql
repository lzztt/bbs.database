DROP PROCEDURE IF EXISTS get_pm_list_sent;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_pm_list_sent(IN $uid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get recent private messages in sent box for a given user'
BEGIN
    SELECT msg_id, MAX(time) AS time, to_uid AS uid,
        (SELECT username FROM users WHERE id = pm.to_uid) AS user,
        (SELECT body FROM priv_msgs WHERE id = pm.msg_id) AS body
    FROM priv_msgs AS pm
    WHERE from_uid = $uid AND from_status > 0
    GROUP BY msg_id
    ORDER BY time DESC
    LIMIT $limit
    OFFSET $offset;
END ;;
DELIMITER ;
