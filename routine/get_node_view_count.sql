DROP PROCEDURE IF EXISTS get_node_view_count;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_node_view_count(IN $nids VARCHAR(20000))
    COMMENT 'get view count for a list of nodes'
BEGIN
    IF LOCATE(',', $nids) = 0 THEN
        SELECT id, view_count FROM nodes WHERE id = CAST($nids AS UNSIGNED INTEGER);
    ELSE
        SET @sql = CONCAT('SELECT id, view_count FROM nodes WHERE id IN (', $nids, ')');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END ;;
DELIMITER ;
