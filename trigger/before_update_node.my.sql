DROP TRIGGER IF EXISTS before_update_node;

DELIMITER ;;
CREATE DEFINER=web@localhost TRIGGER before_update_node BEFORE UPDATE ON nodes FOR EACH ROW
BEGIN
	DECLARE $count INT DEFAULT NULL;
	IF NEW.body != OLD.body THEN
		SELECT COUNT(*) INTO $count FROM nodes WHERE hash = CRC32(NEW.body) AND uid = NEW.uid AND create_time > (NEW.create_time - 86400);
		IF $count > 0 THEN
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'duplicate node found';
		END IF;
	END IF;
END ;;
DELIMITER ;
