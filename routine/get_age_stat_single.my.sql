DROP PROCEDURE IF EXISTS get_age_stat_single;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_age_stat_single(IN $begin INT, IN $end INT)
    COMMENT 'get attendee count'  
BEGIN
    SELECT sex, age, COUNT(id) AS count FROM ff_attendees WHERE time > $begin AND time < $end GROUP BY sex, age;
    SELECT COUNT(NULLIF(sex, 0)) AS male, COUNT(NULLIF(sex, 1)) AS female FROM ff_attendees WHERE time > $time;
END ;;
DELIMITER ;
