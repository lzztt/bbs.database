DROP PROCEDURE IF EXISTS update_access_info_2;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE update_access_info_2(IN $uid INT, IN $time INT, IN $ip VARCHAR(45))
    COMMENT 'update access info for a user'  
BEGIN
    UPDATE users SET last_access_time=$time, last_access_ip2=INET6_ATON($ip) WHERE id = $uid;
END ;;
DELIMITER ;
