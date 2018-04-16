DROP PROCEDURE IF EXISTS get_ad_types;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_ad_types()
    COMMENT 'get ad types'  
BEGIN
    SELECT id, name FROM ad_types;
END ;;
DELIMITER ;
