DROP PROCEDURE IF EXISTS delete_images;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE delete_images(IN $ids VARCHAR(20000))
    COMMENT 'delete images'  
BEGIN
    SET @sql = CONCAT('DELETE FROM images WHERE id IN (', $ids , ')');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
