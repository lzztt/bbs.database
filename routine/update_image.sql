DROP PROCEDURE IF EXISTS update_image;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE update_image(IN $id INT, IN $name VARCHAR(60))
    COMMENT 'update an image'
BEGIN
	UPDATE images SET name = $name WHERE id = $id;
END ;;
DELIMITER ;
