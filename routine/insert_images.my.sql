DROP PROCEDURE IF EXISTS insert_images;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE insert_images(IN $values VARCHAR(20000))
    COMMENT 'insert images'  
BEGIN
	SET @sql = CONCAT('INSERT INTO images (nid,cid,name,path,height,width) VALUES ', $values);
	PREPARE stmt FROM @sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
