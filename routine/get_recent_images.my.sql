DROP PROCEDURE IF EXISTS get_recent_images;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_recent_images()
    COMMENT 'get recent images'  
BEGIN
	( SELECT nid, name, path, title 
	FROM (
		SELECT i.nid, i.name, i.path, n.title, @rn := IF( @nid = i.nid, @rn := @rn + 1, 1 ) AS rn, @nid := i.nid
		FROM images AS i JOIN nodes AS n ON i.nid = n.id 
		WHERE (n.tid = 18 AND n.status = 1) AND i.width >= 600 AND i.height >=300 ORDER BY i.id DESC
	) AS t
	WHERE t.rn < 3 LIMIT 5 )
	UNION
	( SELECT nid, name, path, title 
	FROM (
		SELECT i.nid, i.name, i.path, n.title, @rn := IF( @nid = i.nid, @rn := @rn + 1, 1 ) AS rn, @nid := i.nid
		FROM images AS i JOIN nodes AS n ON i.nid = n.id 
		WHERE (n.tid != 18 AND n.status = 1) AND i.width >= 600 AND i.height >=300 ORDER BY i.id DESC
	) AS t
	WHERE t.rn < 3 LIMIT 5 );
END ;;
DELIMITER ;
