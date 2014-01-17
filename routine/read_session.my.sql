DROP PROCEDURE IF EXISTS read_session;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE read_session(IN $id VARCHAR(32), IN $atime INT)
    COMMENT 'read session data'  
BEGIN
	SELECT SQL_CALC_FOUND_ROWS IFNULL(data, '') FROM sessions WHERE id = $id LIMIT 1;
	IF FOUND_ROWS() < 1 THEN
		INSERT INTO sessions (id,data,atime,uid) VALUES ($id, NULL, $atime, 0);
	ELSE
		UPDATE sessions SET atime = $atime WHERE id = $id;
	END IF;
END ;;
DELIMITER ;
