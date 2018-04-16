DROP PROCEDURE IF EXISTS get_tag_hot_nodes;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_hot_nodes(IN $tids VARCHAR(20000), IN $time INT, IN $limit INT)
    COMMENT 'get recent hot nodes for a list of given tids'  
BEGIN
    IF LOCATE(',', $tids) = 0 THEN
		SELECT n.id AS nid, n.title,
        (SELECT COUNT(DISTINCT c.uid) * 10 + COUNT(*) FROM comments AS c WHERE c.nid = n.id AND c.uid != n.uid) AS score
        FROM nodes AS n
        WHERE create_time > $time AND tid = CAST($tids AS UNSIGNED INTEGER) AND status = 1 
        ORDER BY score DESC, nid DESC 
        LIMIT $limit;
    ELSE
        SET @sql = CONCAT('SELECT n.id AS nid, n.title, '
        ' (SELECT COUNT(DISTINCT c.uid) * 10 + COUNT(*) FROM comments AS c WHERE c.nid = n.id AND c.uid != n.uid) AS score '
        ' FROM nodes AS n '
        ' WHERE create_time > ', $time, ' AND tid IN (', $tids, ') AND status = 1 ORDER BY score DESC, nid DESC '
        ' LIMIT ', $limit);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END ;;
DELIMITER ;
