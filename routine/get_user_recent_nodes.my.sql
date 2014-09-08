DROP PROCEDURE IF EXISTS get_user_recent_nodes;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_recent_nodes(IN $tids VARCHAR(20000), IN $uid INT, IN $limit INT)
    COMMENT 'get recent nodes for a given user'  
BEGIN
    SET @sql = CONCAT('SELECT id AS nid, title, create_time FROM nodes WHERE uid = ' , $uid, ' AND status = 1 AND tid IN (', $tids, ') ORDER BY create_time DESC LIMIT ', $limit);
	PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
