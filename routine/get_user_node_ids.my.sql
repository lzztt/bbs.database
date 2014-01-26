DROP PROCEDURE IF EXISTS get_user_node_ids;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_node_ids(IN $uid INT)
    COMMENT 'get node ids for a given user'  
BEGIN
	SELECT nid FROM nodes WHERE uid = $uid;
END ;;
DELIMITER ;
