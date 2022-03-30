DROP PROCEDURE IF EXISTS get_tag_recent_nodes_yp;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_recent_nodes_yp(IN $limit INT)
    COMMENT 'get recent ads nodes based on exp_time'
BEGIN
    SELECT n.id AS nid, n.title, n.create_time, a.exp_time
    FROM nodes AS n JOIN (
        SELECT nid, exp_time
        FROM ads
        WHERE exp_time > UNIX_TIMESTAMP()
            AND nid NOT IN (SELECT nid FROM node_sticky)
    ) AS a ON a.nid = n.id
    WHERE n.status = 1
    ORDER BY a.exp_time DESC, n.id DESC
    LIMIT $limit;
END ;;
DELIMITER ;
