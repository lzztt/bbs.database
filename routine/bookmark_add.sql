DROP PROCEDURE IF EXISTS bookmark_add;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE bookmark_add(IN $uid INT, IN $nid INT)
    COMMENT 'add a bookmark'
BEGIN
	DECLARE $count INT DEFAULT NULL;
	SELECT COUNT(*) INTO $count FROM bookmarks WHERE uid=$uid AND nid=$nid;

	IF $count = 0 THEN
		INSERT INTO bookmarks (uid,nid,create_time) VALUES ($uid, $nid, UNIX_TIMESTAMP());
	END IF;
END ;;
DELIMITER ;
