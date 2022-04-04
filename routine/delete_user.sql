DROP PROCEDURE IF EXISTS delete_user;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE delete_user(IN $id INT)
    COMMENT 'delete user as a given user'
BEGIN
    UPDATE users SET status = 0 WHERE id = $id;
    UPDATE nodes SET status = 0 WHERE uid = $id;
    set @now = UNIX_TIMESTAMP();
    INSERT INTO spammers (email, time) SELECT email, @now FROM users WHERE id = $id;

    UPDATE node_complaints SET status = 2 WHERE uid = $id;

    UPDATE users  AS u
		JOIN ( SELECT reporter_uid AS uid, COUNT(*) AS score FROM node_complaints WHERE uid = $id AND time > @now -2592000 GROUP BY reporter_uid ) AS rs
        ON u.id = rs.uid
	SET u.contribution = u.contribution + rs.score
    WHERE u.status > 0;
END ;;
DELIMITER ;
