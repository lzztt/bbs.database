DROP PROCEDURE IF EXISTS add_activity;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE add_activity(IN $nid INT, IN $begin INT, IN $end INT)
    COMMENT 'add an activity'  
BEGIN
    REPLACE INTO activities (nid,start_time,end_time) VALUES ($nid, $begin, $end);
END ;;
DELIMITER ;
