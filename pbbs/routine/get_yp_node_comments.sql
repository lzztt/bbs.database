DROP PROCEDURE IF EXISTS get_yp_node_comments;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_yp_node_comments(IN $nid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get comments for a given yp node'  
BEGIN
    SELECT c.*, u.username, (SELECT rating FROM yp_ratings WHERE nid = c.nid AND uid = c.uid) AS rating 
    FROM comments AS c JOIN users AS u ON c.uid = u.id 
    WHERE c.nid = $nid ORDER BY c.create_time ASC
    LIMIT $limit OFFSET $offset;
END ;;
DELIMITER ;
