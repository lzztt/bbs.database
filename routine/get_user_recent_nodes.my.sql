DROP PROCEDURE IF EXISTS get_user_recent_nodes;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_recent_nodes(IN $uid INT, IN $limit INT)
    COMMENT 'get recent nodes for a given user'  
BEGIN
	SELECT id, title, create_time FROM nodes WHERE uid = $uid AND status = 1 ORDER BY create_time DESC LIMIT $limit;
END ;;
DELIMITER ;
