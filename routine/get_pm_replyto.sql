DROP PROCEDURE IF EXISTS get_pm_replyto;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_pm_replyto(IN $mid INT, IN $uid INT)
    COMMENT 'get pm count in inbox for a given user'
BEGIN
    SELECT id, username FROM users WHERE id = (SELECT IF(from_uid = $uid, to_uid, from_uid) FROM priv_msgs WHERE msg_id = $mid LIMIT 1);
END ;;
DELIMITER ;
