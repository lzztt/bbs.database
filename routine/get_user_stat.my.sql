DROP PROCEDURE IF EXISTS get_user_stat;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_stat(IN $time INT)
    COMMENT 'get user stat'  
BEGIN
    SELECT (SELECT count(*) FROM users) AS user_count_total,
           (SELECT count(*) FROM users WHERE create_time >= $time ) AS user_count_recent,
           (SELECT username FROM users WHERE status = 1 ORDER BY id DESC LIMIT 1) AS latest_user;
END ;;
DELIMITER ;
