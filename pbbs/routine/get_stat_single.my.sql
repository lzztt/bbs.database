DROP PROCEDURE IF EXISTS get_stat_single;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_stat_single(IN $time INT)
    COMMENT 'get statistics'  
BEGIN
    SELECT vc.*, ac.*, (SELECT COUNT(*) FROM ff_comments) AS comment, (SELECT COUNT(*) FROM ff_subscribers) AS subscriber
    FROM (SELECT COUNT(*) AS visitor, SUM(count) AS hit FROM ff_counts) AS vc, 
         (SELECT COUNT(NULLIF(sex, 0)) AS male, COUNT(NULLIF(sex, 1)) AS female FROM ff_attendees WHERE time > $time) AS ac;
END ;;
DELIMITER ;
