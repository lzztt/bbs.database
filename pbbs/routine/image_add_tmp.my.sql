DROP PROCEDURE IF EXISTS image_add_tmp;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE image_add_tmp(IN $path VARCHAR(255))
    COMMENT 'add a tmp image'  
BEGIN
    INSERT INTO images_deleted (path) VALUES ($path);
END ;;
DELIMITER ;
