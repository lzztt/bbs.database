DROP PROCEDURE IF EXISTS get_latest_single_activity;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_latest_single_activity()
    COMMENT 'get latest single activity info'
BEGIN
    SELECT * FROM ff_activities ORDER BY id DESC LIMIT 1;
END ;;
DELIMITER ;
