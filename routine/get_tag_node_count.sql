DROP PROCEDURE IF EXISTS get_tag_node_count;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_node_count(IN $tids VARCHAR(20000))
    COMMENT 'get node count for a list of given tags'  
BEGIN
    IF LOCATE(',', $tids) = 0 THEN
        SELECT COUNT(*) FROM nodes WHERE tid = CAST($tids AS UNSIGNED INTEGER);
    ELSE
        SET @sql = CONCAT('SELECT COUNT(*) FROM nodes WHERE tid IN (', $tids, ')');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END ;;
DELIMITER ;
