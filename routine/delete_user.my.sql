DROP PROCEDURE IF EXISTS delete_user;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE delete_user(IN $id INT)
    COMMENT 'delete user as a given user'  
BEGIN
    UPDATE users SET status = 0 WHERE id = $id;
    UPDATE nodes SET status = 0 WHERE uid = $id;
    DELETE FROM sessions WHERE uid = $id;
    INSERT INTO spammers (email, ip, time) SELECT email, last_access_ip, UNIX_TIMESTAMP() FROM users WHERE uid = $id;
END ;;
DELIMITER ;
