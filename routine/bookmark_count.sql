DROP PROCEDURE IF EXISTS bookmark_count;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE bookmark_count(IN $uid INT)
    COMMENT 'count bookmarks of a user'  
BEGIN
    SELECT COUNT(*) FROM nodes WHERE id IN (SELECT nid FROM bookmarks WHERE uid=$uid);
END ;;
DELIMITER ;
