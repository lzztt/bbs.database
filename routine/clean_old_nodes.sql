DROP PROCEDURE IF EXISTS clean_old_nodes;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE clean_old_nodes(IN $tid INT(10), IN $comment_limit INT, IN $time_limit INT)
    COMMENT 'clean old nodes'
BEGIN
    DROP TEMPORARY TABLE IF EXISTS nodes_old;
    CREATE TEMPORARY TABLE nodes_old (
        id INT(10) UNSIGNED,
		comment_count INT(10) UNSIGNED,
		KEY comment_count (comment_count)
    ) ENGINE=MEMORY;

    INSERT INTO nodes_old SELECT n.id, (SELECT COUNT(*) FROM comments WHERE nid = n.id) AS comment_count FROM nodes AS n WHERE n.tid = $tid AND n.create_time < $time_limit AND n.weight = 0;
    DELETE FROM nodes_old WHERE comment_count > $comment_limit;

    UPDATE nodes SET status = 0 WHERE id IN (SELECT id FROM nodes_old);

    DROP TEMPORARY TABLE nodes_old;
END ;;
DELIMITER ;