DROP PROCEDURE IF EXISTS get_ads;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_ads(IN $time INT)
    COMMENT 'get current active ads'  
BEGIN
	SELECT * FROM ads WHERE exp_time > $time ORDER BY exp_time;
END ;;
DELIMITER ;
