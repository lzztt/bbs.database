DROP PROCEDURE IF EXISTS get_attendees_single;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_attendees_single(IN $time INT)
    COMMENT 'get attendees'  
BEGIN
    SELECT a.name, a.sex, a.email, a.time, c.body 
    FROM ff_attendees AS a LEFT JOIN ff_comments AS c ON a.cid = c.id 
    WHERE a.time > $time AND status = 1 
    ORDER BY a.id;
END ;;
DELIMITER ;
