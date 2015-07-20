DROP PROCEDURE IF EXISTS bookmark_delete;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE bookmark_delete(IN $uid INT, IN $nid INT)
    COMMENT 'delete a bookmark'  
BEGIN
    DELETE FROM bookmarks WHERE uid=$uid AND nid=$nid;
END ;;
DELIMITER ;
