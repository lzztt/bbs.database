DROP PROCEDURE IF EXISTS get_activities;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_activities(IN $limit INT, IN $offset INT)
    COMMENT 'get activities'  
BEGIN
	SELECT a.nid, a.start_time, a.end_time, n.title 
	FROM activities AS a JOIN nodes AS n ON a.nid = n.id 
	WHERE a.status = 1 AND n.status = 1
	ORDER BY a.start_time DESC 
	LIMIT $limit 
	OFFSET $offset;
END ;;
DELIMITER ;
