DROP PROCEDURE IF EXISTS get_tag_node_info;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_node_info(IN $tid INT)
    COMMENT 'get node info for a given tag'
BEGIN
    SELECT     (SELECT COUNT(*) FROM nodes WHERE tid = $tid) AS node_count,
            (SELECT count(*) FROM comments WHERE tid = $tid) AS comment_count,
            n.*
    FROM (    ( SELECT n.id AS nid, n.title, n.uid, u.username, n.create_time
                FROM nodes AS n JOIN users AS u ON n.uid = u.id
                WHERE n.tid = $tid AND n.status > 0 AND u.status > 0
                ORDER BY n.create_time DESC LIMIT 1 )
            UNION
            ( SELECT c.nid, n.title, c.uid, u.username, c.create_time
                FROM comments AS c JOIN nodes AS n ON c.nid = n.id JOIN users AS u ON c.uid = u.id
                WHERE c.tid = $tid AND n.status > 0 AND u.status > 0
                ORDER BY c.create_time DESC LIMIT 1 )    ) AS n
    ORDER BY create_time DESC LIMIT 1;
END ;;
DELIMITER ;
