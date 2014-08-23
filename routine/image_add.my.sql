DROP PROCEDURE IF EXISTS image_add;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE image_add(In $nid INT, IN $cid INT, IN $name VARCHAR(60), IN $path VARCHAR(255), IN $height INT, IN $width INT)
    COMMENT 'add an image'  
BEGIN
    INSERT INTO images (nid,cid,name,path,height,width) VALUES ($nid, $cid, $name, $path, $height, $width);
    DELETE FROM images_deleted WHERE path = $path;
END ;;
DELIMITER ;
