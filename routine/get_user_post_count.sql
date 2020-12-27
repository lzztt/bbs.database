DROP PROCEDURE IF EXISTS get_user_post_count;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_post_count(IN $uid INT)
    COMMENT 'get recent post count for a given user'
BEGIN
    SELECT (SELECT count(*) FROM comments WHERE uid = $uid) +
           (SELECT count(*) FROM priv_msgs WHERE from_uid = $uid) AS c;
END ;;
DELIMITER ;
