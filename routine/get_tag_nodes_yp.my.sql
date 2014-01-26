DROP PROCEDURE IF EXISTS get_tag_nodes_yp;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_nodes_yp(IN $tids VARCHAR(20000), IN $limit INT, IN $offset INT)
    COMMENT 'get latest node and comment info for a given yp'  
BEGIN
	IF LOCATE(',', $tids) = 0 THEN
		SELECT n.id, n.title, n.view_count, yp.*, 
		(SELECT COUNT(*) FROM comments WHERE nid = n.id) AS comment_count, 
		IFNULL((SELECT MAX(create_time) FROM comments WHERE nid = n.id), n.create_time) AS last_update_time,
		(SELECT AVG(rating) FROM yp_ratings WHERE nid = n.id) AS rating_avg,
		(SELECT COUNT(*) FROM yp_ratings WHERE nid = n.id) AS rating_count
		FROM nodes AS n JOIN node_yellowpages AS yp ON n.id = yp.nid
		WHERE n.status > 0 AND n.tid = CAST($tids AS UNSIGNED INTEGER) 
		ORDER BY n.weight DESC, last_update_time DESC 
		LIMIT $limit
		OFFSET $offset;
	ELSE
		SET @sql = CONCAT('SELECT n.id, n.title, n.view_count, yp.*, (SELECT COUNT(*) FROM comments WHERE nid = n.id) AS comment_count, IFNULL((SELECT MAX(create_time) FROM comments WHERE nid = n.id), n.create_time) AS last_update_time, (SELECT AVG(rating) FROM yp_ratings WHERE nid = n.id) AS rating_avg, (SELECT COUNT(*) FROM yp_ratings WHERE nid = n.id) AS rating_count FROM nodes AS n JOIN node_yellowpages AS yp ON n.id = yp.nid WHERE n.status > 0 AND n.tid IN (', $tids, ') ORDER BY n.weight DESC, last_update_time DESC LIMIT ', $limit, ' OFFSET ', $offset);
		PREPARE stmt FROM @sql;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
	END IF;
END ;;
DELIMITER ;
