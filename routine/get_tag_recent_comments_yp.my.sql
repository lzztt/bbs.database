DROP PROCEDURE IF EXISTS get_tag_recent_comments_yp;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_recent_comments_yp(IN $tids VARCHAR(20000), IN $limit INT)
    COMMENT 'get recent comments for a list of given tags, based on exp_time'  
BEGIN
    IF LOCATE(',', $tids) = 0 THEN
        SELECT c.nid, MAX(c.id) AS last_cid, n.title, COUNT(*) AS comment_count 
        FROM comments AS c 
			JOIN nodes AS n ON c.nid = n.id 
			JOIN (SELECT yp.nid, ad.exp_time FROM node_yellowpages AS yp JOIN ads AS ad ON yp.ad_id = ad.id WHERE ad.exp_time > UNIX_TIMESTAMP()) AS a ON a.nid = n.id 
        WHERE n.tid = CAST($tids AS UNSIGNED INTEGER) AND n.status = 1 
        GROUP BY c.nid 
        HAVING comment_count > 1
        ORDER BY last_cid DESC 
        LIMIT $limit;
    ELSE
        SET @sql = CONCAT('SELECT c.nid, MAX(c.id) AS last_cid, n.title, COUNT(*) AS comment_count FROM comments AS c JOIN nodes AS n ON c.nid = n.id JOIN (SELECT yp.nid, ad.exp_time FROM node_yellowpages AS yp JOIN ads AS ad ON yp.ad_id = ad.id WHERE ad.exp_time > UNIX_TIMESTAMP()) AS a ON a.nid = n.id WHERE n.tid IN (', $tids, ') AND n.status = 1 GROUP BY c.nid HAVING comment_count > 1 ORDER BY last_cid DESC LIMIT ', $limit);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END ;;
DELIMITER ;