DROP PROCEDURE IF EXISTS get_tag_nodes_yp;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_nodes_yp(IN $tids VARCHAR(20000), IN $limit INT, IN $offset INT)
    COMMENT 'get latest node and comment info for a given yp, based on exp_time'  
BEGIN
    IF LOCATE(',', $tids) = 0 THEN
        SELECT n.id, n.title, n.view_count, yp.*, 
        (SELECT COUNT(*) FROM comments WHERE nid = n.id) AS comment_count, 
        (SELECT AVG(rating) FROM yp_ratings WHERE nid = n.id) AS rating_avg,
        (SELECT COUNT(*) FROM yp_ratings WHERE nid = n.id) AS rating_count
        FROM nodes AS n 
			JOIN node_yellowpages AS yp ON yp.nid = n.id 
			JOIN ads AS ad ON yp.ad_id = ad.id
        WHERE n.status > 0 AND ad.exp_time > UNIX_TIMESTAMP() AND n.tid = CAST($tids AS UNSIGNED INTEGER) 
        ORDER BY ad.exp_time DESC, n.id DESC 
        LIMIT $limit
        OFFSET $offset;
    ELSE
        SET @sql = CONCAT('SELECT n.id, n.title, n.view_count, yp.*, (SELECT COUNT(*) FROM comments WHERE nid = n.id) AS comment_count, (SELECT AVG(rating) FROM yp_ratings WHERE nid = n.id) AS rating_avg, (SELECT COUNT(*) FROM yp_ratings WHERE nid = n.id) AS rating_count FROM nodes AS n JOIN node_yellowpages AS yp ON yp.nid = n.id JOIN ads AS ad ON yp.ad_id = ad.id WHERE n.status > 0 AND ad.exp_time > UNIX_TIMESTAMP() AND n.tid IN (', $tids, ') ORDER BY ad.exp_time DESC, n.id DESC LIMIT ', $limit, ' OFFSET ', $offset);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END ;;
DELIMITER ;
