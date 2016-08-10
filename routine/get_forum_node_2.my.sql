DROP PROCEDURE IF EXISTS get_forum_node_2;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_forum_node_2(IN $nid INT)
    COMMENT 'get info for a given forum node'  
BEGIN
    SELECT n.id, n.uid, n.create_time, n.last_modified_time, n.title, n.body, n.view_count,
		   (SELECT COUNT(*) FROM comments WHERE nid = n.id) AS comment_count, 
           u.username, u.avatar, u.last_access_ip, u.points
    FROM nodes AS n JOIN users AS u ON n.uid = u.id WHERE n.id = $nid AND n.status > 0 AND u.status > 0;
END ;;
DELIMITER ;
