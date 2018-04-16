DROP PROCEDURE IF EXISTS image_add;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE image_add(In $nid INT, IN $cid INT, IN $name VARCHAR(60), IN $path VARCHAR(255), IN $height INT, IN $width INT, IN $city_id INT)
    COMMENT 'add an image'  
BEGIN
    INSERT INTO images (nid,cid,name,path,height,width,city_id) VALUES ($nid, $cid, $name, $path, $height, $width, $city_id);
END ;;
DELIMITER ;
