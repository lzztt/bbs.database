DROP PROCEDURE IF EXISTS get_node_stat;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_node_stat(IN $tids VARCHAR(20000), IN $time INT)
    COMMENT 'get node stat'
BEGIN
    SET @sql = CONCAT('SELECT (SELECT count(*) FROM nodes WHERE tid IN (', $tids, ')) AS node_count_total, (SELECT count(*) FROM comments WHERE tid IN (', $tids, ')) AS comment_count_total, (SELECT count(*) FROM nodes WHERE status = 1 AND create_time >= ', $time, ' AND tid IN (', $tids, ')) as node_count_recent, (SELECT count(*) FROM comments WHERE create_time >= ', $time, ' AND tid IN (', $tids, ') ) as comment_count_recent');
	PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
