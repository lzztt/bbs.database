DROP PROCEDURE IF EXISTS get_node_stat;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_node_stat(IN $time INT)
    COMMENT 'get node stat'  
BEGIN
    SELECT (SELECT count(*) FROM nodes) AS node_count_total,
           (SELECT count(*) FROM comments) AS comment_count_total,
           (SELECT count(*) FROM nodes WHERE status = 1 AND create_time >= $time ) as node_count_recent,
           (SELECT count(*) FROM comments WHERE create_time >= $time ) as comment_count_recent;
END ;;
DELIMITER ;
