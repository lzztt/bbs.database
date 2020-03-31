DROP PROCEDURE IF EXISTS get_comment_images;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_comment_images(IN $cid INT)
    COMMENT 'get images for a given node'
BEGIN
    SELECT id, name, path FROM images WHERE cid = $cid ORDER BY id ASC;
END ;;
DELIMITER ;
