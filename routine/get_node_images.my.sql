DROP PROCEDURE IF EXISTS get_node_images;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_node_images(IN $nid INT)
    COMMENT 'get images for a given node'  
BEGIN
	SELECT id, name, path FROM images WHERE cid IS NULL AND nid = $nid ORDER BY id ASC;
END ;;
DELIMITER ;
