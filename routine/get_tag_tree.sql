DROP PROCEDURE IF EXISTS get_tag_tree;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_tag_tree(IN $tid INT)
    COMMENT 'clean houstonbbs database tables'
BEGIN
    DECLARE $lvl INT DEFAULT NULL;
    DECLARE $cnt INT DEFAULT NULL;
    DROP TEMPORARY TABLE IF EXISTS tags_t, ids_t;
    CREATE TEMPORARY TABLE tags_t (
        id int(10) unsigned,
        name varchar(60),
        description varchar(255),
        parent int(10) unsigned,
        weight int(10) unsigned,
        level int(10) unsigned,
        PRIMARY KEY (id),
        KEY level (level)
    ) ENGINE=MEMORY DEFAULT CHARSET=utf8;
    CREATE TEMPORARY TABLE ids_t (
        id int(10) unsigned,
        PRIMARY KEY (id)
    ) ENGINE=MEMORY;

    SET $lvl = 0;
    INSERT INTO tags_t SELECT id, name, description, parent, weight, $lvl FROM tags WHERE id = $tid  LIMIT 1;

    REPEAT
        TRUNCATE TABLE ids_t;
        INSERT INTO ids_t SELECT id FROM tags_t WHERE level = $lvl GROUP BY id;
        SET $lvl = $lvl + 1;
        INSERT INTO tags_t SELECT id, name, description, parent, weight, $lvl
            FROM tags
            WHERE parent IN (SELECT id FROM ids_t)
            ORDER BY parent, weight;
        SELECT ROW_COUNT() INTO $cnt;
    UNTIL $cnt = 0 END REPEAT;

    SELECT * FROM tags_t;
    DROP TEMPORARY TABLE tags_t, ids_t;
END ;;
DELIMITER ;
