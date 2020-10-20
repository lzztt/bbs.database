DROP PROCEDURE IF EXISTS get_tag_nodes;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_nodes(IN $tid INT, IN $city_id INT, IN $limit INT, IN $offset INT)
    COMMENT 'get node info for a given tag'
BEGIN
	SELECT n.id, n.title, n.create_time, u.id AS uid, u.username
    FROM nodes AS n JOIN users AS u ON n.uid = u.id
    WHERE n.status > 0 AND n.tid = $tid AND u.status > 0 -- AND n.cid = $city_id
    ORDER BY n.create_time DESC
    LIMIT $limit
    OFFSET $offset;
END ;;
DELIMITER ;
