--
-- Dumping routines for database 'hbbs'
--
DROP PROCEDURE IF EXISTS check_pm;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE check_pm(IN uid INT, IN nmsg INT)
    COMMENT 'check pm of a user'
BEGIN 
    SELECT
        (SELECT username FROM users WHERE id = p.from_uid) AS fromUser, 
        (SELECT username FROM users WHERE id = p.to_uid) AS toUser,
        FROM_UNIXTIME(time) AS sendTime,
        p.body
    FROM 
        priv_msgs AS p 
    WHERE
        from_uid = uid
        OR
        to_uid = uid
    ORDER BY
        mid DESC
    LIMIT
        nmsg; 
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS clean;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE clean()
    COMMENT 'clean houstonbbs database tables'  
BEGIN
    DROP TEMPORARY TABLE IF EXISTS users_t, nodes_t, comments_t, node_points_t, comment_points_t;
    CREATE TEMPORARY TABLE users_t AS
        SELECT id FROM users WHERE status = 0;
    ALTER TABLE users_t ADD PRIMARY KEY (id);

    CREATE TEMPORARY TABLE nodes_t AS
        SELECT id FROM nodes WHERE status = 0 OR uid IN (SELECT id FROM users_t);
    ALTER TABLE nodes_t ADD PRIMARY KEY (id);

    CREATE TEMPORARY TABLE comments_t AS
        SELECT id FROM comments WHERE nid IN (SELECT id FROM nodes_t) OR uid IN (SELECT id FROM users_t);
    ALTER TABLE comments_t ADD PRIMARY KEY (id);

    CREATE TEMPORARY TABLE node_points_t AS
        SELECT uid, COUNT(*)*3 AS point FROM nodes WHERE id IN (SELECT id FROM nodes_t) AND uid NOT IN (SELECT id FROM users_t) GROUP BY uid;
    ALTER TABLE node_points_t ADD PRIMARY KEY (uid);

    CREATE TEMPORARY TABLE comment_points_t AS
        SELECT uid, COUNT(*) AS point FROM comments WHERE id IN (SELECT id FROM nodes_t) AND uid NOT IN (SELECT id FROM users_t) GROUP BY uid;
    ALTER TABLE comment_points_t ADD PRIMARY KEY (uid);

    DELETE FROM users WHERE id IN (SELECT id FROM users_t);
    DELETE FROM nodes WHERE id IN (SELECT id FROM nodes_t);
    DELETE FROM comments WHERE id IN (SELECT id FROM comments_t);
    DELETE FROM pm USING priv_msgs AS pm JOIN users_t AS u ON pm.from_uid = u.id OR pm.to_uid = u.id;
    DELETE FROM Session WHERE uid IN (SELECT id FROM users_t);
    DELETE FROM yp_ratings WHERE uid IN (SELECT id FROM users_t);

    INSERT INTO images_deleted (id, path) SELECT id, path FROM images WHERE nid IN (SELECT id FROM nodes_t) OR cid IN (SELECT id FROM comments_t);
    DELETE FROM images WHERE nid IN (SELECT id FROM nodes_t) OR cid IN (SELECT id FROM comments_t);
    DELETE FROM activities WHERE nid IN (SELECT id FROM nodes_t);
    DELETE FROM yp_ratings WHERE nid IN (SELECT id FROM nodes_t);
    UPDATE users AS u JOIN node_points_t AS p ON u.id = p.uid SET u.points = IF(u.points > p.point, u.points - p.point, 0);
    UPDATE users AS u JOIN comment_points_t AS p ON u.id = p.uid SET u.points = IF(u.points > p.point, u.points - p.point, 0);

    DROP TEMPORARY TABLE users_t, nodes_t, comments_t, node_points_t, comment_points_t;
END ;;
DELIMITER ;