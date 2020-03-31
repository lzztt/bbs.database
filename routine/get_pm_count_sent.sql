DROP PROCEDURE IF EXISTS get_pm_count_sent;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_pm_count_sent(IN $uid INT)
    COMMENT 'get pm count in sent box for a given user'
BEGIN
    SELECT COUNT(DISTINCT msg_id) FROM priv_msgs WHERE from_uid = $uid AND from_status > 0;
END ;;
DELIMITER ;
