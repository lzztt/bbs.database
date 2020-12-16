DROP PROCEDURE IF EXISTS get_tag_nodes_forum;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_nodes_forum(IN $city_id INT, IN $tid INT, IN $limit INT, IN $offset INT)
    COMMENT 'get latest node and comment info for a given forum'
BEGIN
    DECLARE    $count INT;

    DROP TEMPORARY TABLE IF EXISTS nodes_t;
    CREATE TEMPORARY TABLE nodes_t (
        id int(10) unsigned,
        title varchar(255),
        weight int(8),
        create_time int(11) unsigned,
        creater_uid int(10) unsigned,
        creater_name varchar(60),
        comment_count int(10) unsigned DEFAULT 0,
        PRIMARY KEY (id)
    ) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

    IF $offset = 0 THEN
        INSERT INTO nodes_t (id, title, create_time, creater_uid, weight)
        SELECT n.id, n.title, n.create_time, n.uid, IF(ns.cid IS NULL, ns.weight, ns.cid * 100 + ns.weight) AS w
        FROM node_sticky ns JOIN nodes n ON ns.nid = n.id
        WHERE (ns.tid = $tid OR ns.cid = $city_id) AND n.status > 0
        ORDER BY w DESC;

        SELECT $limit - ROW_COUNT() INTO $count;

        INSERT INTO nodes_t (id, title, create_time, creater_uid, weight)
        SELECT n.id, n.title, n.create_time, n.uid, 0
        FROM nodes n
        WHERE n.tid = $tid AND n.status > 0 AND n.id NOT IN (SELECT id FROM nodes_t)
        ORDER BY last_comment_time DESC
        LIMIT $count;
    ELSE
        SELECT $offset - COUNT(*) INTO $count
        FROM node_sticky ns JOIN nodes n ON ns.nid = n.id
        WHERE (ns.tid = 8 OR ns.cid = 1) AND n.status > 0;

        INSERT INTO nodes_t (id, title, create_time, creater_uid, weight)
        SELECT n.id, n.title, n.create_time, n.uid, 0
        FROM nodes n
        WHERE n.tid = $tid AND n.status > 0
        ORDER BY last_comment_time DESC
        LIMIT $limit
        OFFSET $count;
    END IF;

    UPDATE nodes_t, (
        SELECT nid, COUNT(*) AS count
        FROM comments
        WHERE nid IN (SELECT id FROM nodes_t)
        GROUP BY nid
    ) AS t
    SET nodes_t.comment_count = t.count - 1
    WHERE nodes_t.id = t.nid;

    UPDATE nodes_t, (
        SELECT id, username
        FROM users
        WHERE id IN (SELECT creater_uid FROM nodes_t)
    ) AS t
    SET nodes_t.creater_name = t.username
    WHERE nodes_t.creater_uid = t.id;

    SELECT * FROM nodes_t;
    DROP TEMPORARY TABLE nodes_t;
END ;;
DELIMITER ;
