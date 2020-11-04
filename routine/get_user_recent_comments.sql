DROP PROCEDURE IF EXISTS get_user_recent_comments;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_recent_comments(IN $tids VARCHAR(16383), IN $uid INT, IN $limit INT)
    COMMENT 'get recent comments for a given user'
BEGIN
    SET @sql = CONCAT('SELECT c.nid, n.title, MAX(c.create_time) AS create_time FROM comments AS c JOIN nodes AS n ON c.nid = n.id WHERE c.uid = ', $uid, ' AND c.tid IN (', $tids, ') AND n.status = 1 GROUP BY c.nid ORDER BY create_time DESC LIMIT ', $limit);
	PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
