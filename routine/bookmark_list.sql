DROP PROCEDURE IF EXISTS bookmark_list;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE bookmark_list(IN $uid INT, IN  $limit INT, IN $offset INT)
    COMMENT 'list bookmarks of a user'
BEGIN
    SELECT n.id, n.title, n.uid, u.username, n.last_comment_time
    FROM bookmarks AS b
        JOIN nodes AS n ON b.nid = n.id
        JOIN users AS u ON n.uid = u.id
    WHERE b.uid=$uid
    ORDER BY b.create_time DESC
    LIMIT $limit
    OFFSET $offset;
END ;;
DELIMITER ;
