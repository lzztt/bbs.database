DROP PROCEDURE IF EXISTS get_pm;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_pm(IN $mid INT, IN $uid INT)
    COMMENT 'get pm count in inbox for a given user'  
sp: BEGIN
	DECLARE $found INT DEFAULT 0;

	SELECT IF(from_uid = $uid, 1, IF(to_uid = $uid, 1, 0)) INTO $found FROM priv_msgs WHERE msg_id = $mid LIMIT 1;
	IF $found != 1 THEN
		SELECT NULL LIMIT 0;
		LEAVE sp;
	END IF;

    UPDATE priv_msgs SET to_status = 1 WHERE msg_id = $mid AND to_uid = $uid AND to_status = 2;

    SELECT m.id, m.time, m.body, u.id AS uid, u.username, u.avatar 
    FROM priv_msgs AS m JOIN users AS u ON m.from_uid = u.id 
    WHERE m.msg_id = $mid AND IF(m.from_uid = $uid, from_status, to_status) > 0
    ORDER BY m.time;
END ;;
DELIMITER ;
