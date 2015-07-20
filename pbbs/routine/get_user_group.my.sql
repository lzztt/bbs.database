DROP PROCEDURE IF EXISTS get_user_group;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_user_group(IN $uid INT)
    COMMENT 'get user groups for a given user'  
BEGIN
    select ug.name from user_group_map AS m JOIN user_groups AS ug ON m.gid = ug.id where m.uid = $uid;
END ;;
DELIMITER ;