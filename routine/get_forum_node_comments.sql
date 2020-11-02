DROP PROCEDURE IF EXISTS get_forum_node_comments;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_forum_node_comments(IN $nid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get comments for a given forum node'
BEGIN
    SELECT c.*, u.username, u.create_time AS join_time, u.last_access_ip AS access_ip, u.avatar, u.points
    FROM comments AS c JOIN users AS u ON c.uid = u.id WHERE c.nid = $nid AND u.status > 0 ORDER BY c.create_time ASC LIMIT $limit OFFSET $offset;
END ;;
DELIMITER ;
