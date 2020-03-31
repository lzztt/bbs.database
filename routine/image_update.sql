DROP PROCEDURE IF EXISTS image_update;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE image_update(IN $id INT, IN $name VARCHAR(60))
    COMMENT 'update an image'
BEGIN
    UPDATE images SET name = $name WHERE id = $id;
END ;;
DELIMITER ;
