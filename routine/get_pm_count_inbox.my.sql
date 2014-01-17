DROP PROCEDURE IF EXISTS get_pm_count_inbox;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_pm_count_inbox(IN $uid INT)
    COMMENT 'get pm count in inbox for a given user'  
BEGIN
	SELECT COUNT(DISTINCT msg_id) FROM priv_msgs WHERE to_uid = $uid AND to_status > 0;
END ;;
DELIMITER ;
