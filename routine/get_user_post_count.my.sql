DROP PROCEDURE IF EXISTS get_user_post_count;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_post_count(IN $uid INT, IN $time INT)
    COMMENT 'get recent post count for a given user'  
BEGIN
	SELECT ( SELECT count(*) FROM nodes WHERE uid = $uid AND create_time > $time ) +
		   ( SELECT count(*) FROM comments WHERE uid = $uid AND create_time > $time ) AS c;
END ;;
DELIMITER ;
