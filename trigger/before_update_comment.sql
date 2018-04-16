DROP TRIGGER IF EXISTS before_update_comment;

DELIMITER ;;
CREATE DEFINER=web@localhost TRIGGER before_update_comment BEFORE UPDATE ON comments FOR EACH ROW
BEGIN
    DECLARE $count INT DEFAULT NULL;
    IF NEW.body != OLD.body THEN
        SELECT COUNT(*) INTO $count FROM comments WHERE hash = CRC32(NEW.body) AND uid = NEW.uid AND create_time > (NEW.create_time - 30);
        IF $count > 0 THEN
            SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'duplicate comment found';
        END IF;
    END IF;
END ;;
DELIMITER ;
