DROP PROCEDURE IF EXISTS get_pm_list_inbox;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_pm_list_inbox(IN $uid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get recent private messages in inbox for a given user'
BEGIN
    SELECT msg_id, MAX(time) AS time, from_uid AS uid, (MAX(to_status) > 1) AS is_new,
        (SELECT username FROM users WHERE id = pm.from_uid) AS user,
        (SELECT body FROM priv_msgs WHERE id = pm.msg_id) AS body
    FROM priv_msgs AS pm
    WHERE to_uid = $uid AND to_status > 0
    GROUP BY msg_id
    ORDER BY time DESC
    LIMIT $limit
    OFFSET $offset;
END ;;
DELIMITER ;
