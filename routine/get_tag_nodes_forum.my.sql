DROP PROCEDURE IF EXISTS get_tag_nodes_forum;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_nodes_forum(IN $city_id INT, IN $tid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get latest node and comment info for a given forum'
BEGIN
    DECLARE $done INT DEFAULT FALSE;
    DECLARE    $nid INT;
    DECLARE    $create_time INT;
    DECLARE    $comment_time INT;
    DECLARE    $cid INT;
    DECLARE $count INT;
    DECLARE $cur CURSOR FOR SELECT id, create_time, comment_time FROM nodes_t;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET $done = TRUE;

    DROP TEMPORARY TABLE IF EXISTS nodes_t;
    CREATE TEMPORARY TABLE nodes_t (
        id int(10) unsigned,
        title varchar(255),
        weight tinyint(3),
        create_time int(11) unsigned,
        creater_uid int(10) unsigned,
        creater_name varchar(60),
        comment_time int(11) unsigned,
        commenter_uid int(10) unsigned,
        commenter_name varchar(60),
        comment_count int(10) unsigned DEFAULT 0,
        PRIMARY KEY (id)
    ) ENGINE=MEMORY DEFAULT CHARSET=utf8;

    INSERT INTO nodes_t (id, title, weight, create_time, creater_uid, creater_name, comment_time)
        SELECT n.id, n.title, n.weight, n.create_time, n.uid, u.username,
            IFNULL((SELECT MAX(create_time) FROM comments WHERE nid = n.id), n.create_time) AS comment_time
        FROM nodes AS n JOIN users AS u ON n.uid = u.id
        WHERE (n.status > 0 AND n.tid = $tid AND u.status > 0) OR n.id IN (SELECT nid FROM node_sticky WHERE cid = $city_id)
        ORDER BY n.weight DESC, comment_time DESC
        LIMIT $limit
        OFFSET $offset;

    OPEN $cur;
    FETCH $cur INTO $nid, $create_time, $comment_time;

    WHILE NOT $done DO
        IF $comment_time = $create_time THEN
            UPDATE nodes_t SET comment_count = 0, comment_time = NULL WHERE id = $nid;
        ELSE
            SELECT MAX(id), COUNT(*) - 1 INTO $cid, $count FROM comments WHERE nid = $nid;
            UPDATE nodes_t AS n, (SELECT uid, (SELECT username FROM users WHERE id = comments.uid LIMIT 1) AS username FROM comments WHERE id = $cid) AS c
            SET n.commenter_uid = c.uid, n.commenter_name = c.username, n.comment_count = $count
            WHERE n.id = $nid;
        END IF;
        FETCH $cur INTO $nid, $create_time, $comment_time;
    END WHILE;

    CLOSE $cur;

    SELECT * FROM nodes_t;
    DROP TEMPORARY TABLE nodes_t;
END ;;
DELIMITER ;
