DROP PROCEDURE IF EXISTS get_user_stat;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_stat(IN $time INT, IN $cid INT)
    COMMENT 'get user stat'  
BEGIN
    SELECT (SELECT count(*) FROM users WHERE cid = $cid) AS user_count_total,
           (SELECT count(*) FROM users WHERE create_time >= $time AND cid = $cid) AS user_count_recent,
           (SELECT username FROM users WHERE status > 0 AND cid = $cid ORDER BY id DESC LIMIT 1) AS latest_user;
END ;;
DELIMITER ;
