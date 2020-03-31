DROP PROCEDURE IF EXISTS get_age_stat_single;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_age_stat_single(IN $aid INT)
    COMMENT 'get attendee count'
BEGIN
    SELECT sex, age, COUNT(id) AS count FROM ff_attendees WHERE aid = $aid GROUP BY sex, age;
END ;;
DELIMITER ;
