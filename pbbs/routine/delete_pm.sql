DROP PROCEDURE IF EXISTS delete_pm;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE delete_pm(IN $id INT, IN $uid INT)
    COMMENT 'delete pm as a given user'  
BEGIN
    DECLARE $msg_id INT DEFAULT NULL;
    DECLARE $from_uid INT DEFAULT NULL;
    DECLARE $to_uid INT DEFAULT NULL;
    DECLARE $from_status INT DEFAULT NULL;
    DECLARE $to_status INT DEFAULT NULL;

    SELECT msg_id, from_uid, to_uid, from_status, to_status
        INTO $msg_id, $from_uid, $to_uid, $from_status, $to_status
    FROM priv_msgs WHERE id = $id;

    IF $id = $msg_id THEN
        UPDATE priv_msgs SET from_status = 0 WHERE msg_id = $id AND from_uid = $uid AND from_status > 0;
        UPDATE priv_msgs SET to_status = 0 WHERE msg_id = $id AND to_uid = $uid AND to_status > 0;
    ELSEIF $uid = $from_uid THEN 
        IF $from_status > 0 THEN
            UPDATE priv_msgs SET from_status = 0 WHERE id = $id;
        END IF;
    ELSEIF $uid = $to_uid THEN 
        IF $to_status > 0 THEN
            UPDATE priv_msgs SET to_status = 0 WHERE id = $id;
        END IF;
    ELSEIF $msg_id IS NULL THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'message not found';
    ELSE 
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'uid need be either from_uid or to_uid';
    END IF;
END ;;
DELIMITER ;
