DROP PROCEDURE IF EXISTS get_attendee_comments_single;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_attendee_comments_single(IN $begin INT, IN $end INT)
    COMMENT 'get attendee comments'  
BEGIN
	SELECT name, body, time FROM ff_comments WHERE time > $begin AND time < $end ORDER BY id ASC;
END ;;
DELIMITER ;
