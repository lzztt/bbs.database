DROP PROCEDURE IF EXISTS get_forum_node;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_forum_node(IN $nid INT)
    COMMENT 'get info for a given forum node'
BEGIN
    SELECT n.*, (SELECT COUNT(*) FROM comments WHERE nid = n.id) AS comment_count,
            u.username, u.create_time AS join_time, (SELECT ip FROM session_events WHERE user_id = u.id ORDER BY time DESC LIMIT 1) AS access_ip, u.avatar, (u.contribution + u.reputation) AS points
    FROM nodes AS n JOIN users AS u ON n.uid = u.id WHERE n.status > 0 AND u.status > 0 AND n.id = $nid;
END ;;
DELIMITER ;
