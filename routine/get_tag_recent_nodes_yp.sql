DROP PROCEDURE IF EXISTS get_tag_recent_nodes_yp;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_recent_nodes_yp(IN $limit INT)
    COMMENT 'get recent yellow page nodes for a list of given tags, based on exp_time'
BEGIN
    SELECT n.id AS nid, n.title, n.create_time, a.exp_time
    FROM nodes AS n JOIN (SELECT yp.nid, ad.exp_time FROM node_yellowpages AS yp JOIN ads AS ad ON yp.ad_id = ad.id WHERE ad.exp_time > UNIX_TIMESTAMP()) AS a ON a.nid = n.id
    WHERE n.status = 1
    ORDER BY a.exp_time DESC, n.id DESC
    LIMIT $limit;
END ;;
DELIMITER ;
