DROP PROCEDURE IF EXISTS get_yp_node;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_yp_node(IN $nid INT)
    COMMENT 'get info for a given yp node'  
BEGIN
    SELECT n.id, n.title, n.body, yp.*, c.comment_count, r.*, IFNULL(c.create_time, n.create_time) AS last_update_time 
    FROM nodes AS n JOIN node_yellowpages AS yp ON n.id = yp.nid, 
        (SELECT COUNT(*) AS comment_count, MAX(create_time) AS create_time FROM comments WHERE nid = $nid) AS c, 
        (SELECT avg(rating) AS rating_avg, count(*) AS rating_count FROM yp_ratings WHERE nid = $nid) AS r 
    WHERE n.status > 0 AND n.id = $nid;
END ;;
DELIMITER ;
