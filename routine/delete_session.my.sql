DROP PROCEDURE IF EXISTS delete_session;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE delete_session(IN $id VARCHAR(32))
    COMMENT 'delete session data'  
BEGIN
	DELETE FROM sessions WHERE id = $id LIMIT 1;
END ;;
DELIMITER ;
