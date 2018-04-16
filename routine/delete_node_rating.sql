DROP PROCEDURE IF EXISTS delete_node_rating;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE delete_node_rating(IN $nid INT, IN $uid INT)
    COMMENT 'delete node rating of a user'  
BEGIN
    DELETE FROM yp_ratings WHERE nid = $nid AND uid = $uid;
END ;;
DELIMITER ;
