DROP PROCEDURE IF EXISTS get_user_recent_comments;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_recent_comments(IN $uid INT, IN $limit INT)
    COMMENT 'get recent comments for a given user'  
BEGIN
    SELECT c.nid, n.title, c.create_time FROM comments AS c JOIN nodes AS n ON c.nid = n.id WHERE c.uid = $uid AND n.status = 1 GROUP BY c.nid ORDER BY c.create_time DESC LIMIT $limit;
END ;;
DELIMITER ;
