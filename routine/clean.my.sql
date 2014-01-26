DROP PROCEDURE IF EXISTS clean;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE clean()
    COMMENT 'clean tables'  
BEGIN
    DROP TEMPORARY TABLE IF EXISTS users_t, nodes_t, comments_t;	
    CREATE TEMPORARY TABLE users_t (
		id int(10) unsigned,
		PRIMARY KEY (id)
	) ENGINE=MEMORY;
	CREATE TEMPORARY TABLE nodes_t (
		id int(10) unsigned,
		PRIMARY KEY (id)
	) ENGINE=MEMORY;
	CREATE TEMPORARY TABLE comments_t (
		id int(10) unsigned,
		PRIMARY KEY (id)
	) ENGINE=MEMORY;

    INSERT INTO users_t SELECT id FROM users WHERE status = 0;    
    INSERT INTO nodes_t SELECT id FROM nodes WHERE status = 0;
    INSERT INTO comments_t SELECT id FROM comments WHERE nid IN (SELECT id FROM nodes_t) OR uid IN (SELECT id FROM users_t);

    DELETE FROM users WHERE id IN (SELECT id FROM users_t);
    DELETE FROM nodes WHERE id IN (SELECT id FROM nodes_t);
	DELETE FROM node_yellowpages WHERE id IN (SELECT id FROM nodes_t);
    DELETE FROM comments WHERE id IN (SELECT id FROM comments_t);
	DELETE FROM pm USING priv_msgs AS pm JOIN users_t AS u ON (pm.from_uid = u.id OR pm.to_uid = u.id);
    DELETE FROM sessions WHERE uid IN (SELECT id FROM users_t);
    DELETE FROM yp_ratings WHERE uid IN (SELECT id FROM users_t);
    DELETE FROM images WHERE nid IN (SELECT id FROM nodes_t) OR cid IN (SELECT id FROM comments_t);
    DELETE FROM activities WHERE nid IN (SELECT id FROM nodes_t);
    DELETE FROM yp_ratings WHERE nid IN (SELECT id FROM nodes_t);

    DROP TEMPORARY TABLE users_t, nodes_t, comments_t;
END ;;
DELIMITER ;
