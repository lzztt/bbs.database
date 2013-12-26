DROP PROCEDURE IF EXISTS get_recent_nodes;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_recent_nodes(IN $tids VARCHAR(255), IN $limit INT)
    COMMENT 'get recent nodes for a list of given tags'  
BEGIN
	IF LOCATE(',', $tids) = 0 THEN
		SELECT id, title, create_time 
		FROM nodes 
		WHERE tid = CAST($tids AS UNSIGNED INTEGER) AND status = 1 
		ORDER BY create_time DESC 
		LIMIT $limit;
	ELSE
		SET @sql = CONCAT('SELECT id, title, create_time FROM nodes WHERE tid IN (', $tids, ') AND status = 1 ORDER BY create_time DESC LIMIT ', $limit);
		PREPARE stmt FROM @sql;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
	END IF;
END ;;
DELIMITER ;
