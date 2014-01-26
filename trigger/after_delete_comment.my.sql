DROP TRIGGER IF EXISTS after_delete_comment;

DELIMITER ;;
CREATE DEFINER=web@localhost TRIGGER after_delete_comment AFTER DELETE ON comments FOR EACH ROW
BEGIN
	DELETE FROM images WHERE cid = OLD.id;
END ;;
DELIMITER ;
