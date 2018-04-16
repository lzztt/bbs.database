DROP PROCEDURE IF EXISTS get_forum_node_comments_2;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_forum_node_comments_2(IN $nid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get comments for a given forum node'  
BEGIN
	SELECT c.id, c.uid, c.create_time, c.last_modified_time, c.body, u.username, u.avatar, u.last_access_ip
    FROM comments AS c JOIN users AS u ON c.uid = u.id WHERE c.nid = $nid AND u.status > 0 ORDER BY c.create_time ASC LIMIT $limit OFFSET $offset; 
END ;;
DELIMITER ;
