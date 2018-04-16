DROP PROCEDURE IF EXISTS update_node_rating;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE update_node_rating(IN $nid INT, IN $uid INT, IN $rating INT, IN $time INT)
    COMMENT 'update user as a given user'  
BEGIN
    REPLACE INTO yp_ratings (nid,uid,rating,time) VALUES ( $nid, $uid, $rating, $time);
END ;;
DELIMITER ;
