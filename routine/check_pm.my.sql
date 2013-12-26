DROP PROCEDURE IF EXISTS check_pm;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE check_pm(IN $uid INT, IN $nmsg INT)
    COMMENT 'check private messages of a user'
BEGIN 
    SELECT
        (SELECT username FROM users WHERE id = p.from_uid) AS from_user, 
        (SELECT username FROM users WHERE id = p.to_uid) AS to_user,
        FROM_UNIXTIME(time) AS time,
        p.body
    FROM 
        priv_msgs AS p 
    WHERE
        from_uid = $uid
        OR
        to_uid = $uid
    ORDER BY
        id DESC
    LIMIT
        $nmsg; 
END ;;
DELIMITER ;
