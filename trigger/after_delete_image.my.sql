DROP TRIGGER IF EXISTS after_delete_image;

DELIMITER ;;
CREATE DEFINER=web@localhost TRIGGER after_delete_image AFTER DELETE ON images FOR EACH ROW
BEGIN
	INSERT INTO images_deleted (id, path) VALUES (OLD.id, OLD.path);
END ;;
DELIMITER ;
