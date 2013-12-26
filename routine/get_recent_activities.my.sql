DROP PROCEDURE IF EXISTS get_recent_activities;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_recent_activities(IN $now INT, IN $limit INT)
    COMMENT 'get recent nodes for a list of given tags'  
BEGIN
	DROP TEMPORARY TABLE IF EXISTS activities_t;
	CREATE TEMPORARY TABLE activities_t (
		nid int(10) unsigned,
		start_time int(11) unsigned,
		title varchar(255),
		class varchar(63)
	) ENGINE=MEMORY DEFAULT CHARSET=utf8;

	INSERT INTO activities_t
		SELECT a.nid, a.start_time, n.title, IF(a.start_time < $now, "now", "future") AS class 
		FROM activities AS a JOIN nodes AS n ON a.nid = n.id 
		WHERE a.status = 1 AND a.end_time > $now ORDER BY a.start_time LIMIT $limit;

	SELECT $limit - ROW_COUNT() INTO $limit;
	IF $limit > 0 THEN
		INSERT INTO activities_t
			SELECT a.nid, a.start_time, n.title, "old" AS class 
			FROM activities AS a JOIN nodes AS n ON a.nid = n.id 
			WHERE a.status = 1 AND a.end_time <= $now ORDER BY a.start_time DESC LIMIT $limit;
	END IF;
    
	SELECT * FROM activities_t;
	DROP TEMPORARY TABLE activities_t;
END ;;
DELIMITER ;
