DROP PROCEDURE IF EXISTS get_attendee_count_single;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_attendee_count_single(IN $time INT)
    COMMENT 'get attendee count'  
BEGIN
	SELECT COUNT(NULLIF(sex, 0)) AS male, COUNT(NULLIF(sex, 1)) AS female FROM ff_attendees WHERE time > $time;
END ;;
DELIMITER ;
