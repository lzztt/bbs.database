DROP PROCEDURE IF EXISTS get_user_online;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_online(IN $time INT, IN $cid INT)
    COMMENT 'get online user info'  
BEGIN
    SELECT s.uid, u.username FROM sessions AS s LEFT JOIN users AS u ON s.uid = u.id WHERE s.atime > $time AND s.cid = $cid;
END ;;
DELIMITER ;
