DROP PROCEDURE IF EXISTS bookmark_list;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE bookmark_list(IN $uid INT, IN  $limit INT, IN $offset INT)
    COMMENT 'list bookmarks of a user'  
BEGIN
    SELECT n.id, n.title FROM bookmarks AS b JOIN nodes AS n ON b.nid = n.id WHERE b.uid=$uid ORDER BY b.create_time DESC LIMIT $limit OFFSET $offset;
END ;;
DELIMITER ;
