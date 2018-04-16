DROP PROCEDURE IF EXISTS `get_tag_node_info_1`;

DELIMITER ;;
CREATE DEFINER=`web`@`localhost` PROCEDURE `get_tag_node_info_1`(IN $tid INT)
    COMMENT 'get node info for a given tag'
BEGIN
    ( SELECT n.id AS nid, 0 as cid, n.title, n.uid, u.username, n.create_time 
                FROM nodes AS n JOIN users AS u ON n.uid = u.id 
                WHERE n.tid = $tid AND n.status > 0 AND u.status > 0 
                ORDER BY n.id DESC LIMIT 1 )
        UNION
        ( SELECT c.nid, c.id as cid, n.title, c.uid, u.username, c.create_time
                FROM comments AS c JOIN nodes AS n ON c.nid = n.id JOIN users AS u ON c.uid = u.id 
                WHERE c.tid = $tid AND n.status > 0 AND u.status > 0 
                ORDER BY c.id DESC LIMIT 1 );
END ;;
DELIMITER ;

