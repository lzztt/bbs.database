DROP PROCEDURE IF EXISTS update_access_info;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE update_access_info(IN $uid INT, IN $time INT, IN $ip INT)
    COMMENT 'update access info for a user'  
BEGIN
    UPDATE users SET last_access_time=$time, last_access_ip=$ip WHERE id = $uid;
END ;;
DELIMITER ;
