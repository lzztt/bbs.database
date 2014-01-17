DROP PROCEDURE IF EXISTS write_session;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE write_session(IN $id VARCHAR(32), IN $data TEXT, IN $uid INT)
    COMMENT 'write session data'  
BEGIN
	UPDATE sessions SET data=NULLIF($data,''), uid = $uid WHERE id = $id;
END ;;
DELIMITER ;
