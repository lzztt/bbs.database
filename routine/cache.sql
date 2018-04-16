DROP PROCEDURE IF EXISTS cache_is_enabled;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE cache_is_enabled()
    COMMENT 'check if cache tables enabled'
BEGIN
    SELECT name = 'cache.enabled' AS is_enabled FROM cache_names WHERE id = 1;
END ;;
DELIMITER ;



DROP PROCEDURE IF EXISTS cache_enable;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE cache_enable()
    COMMENT 'enable cache tables'
BEGIN
    TRUNCATE cache_names;
    TRUNCATE cache_tree_houston;
    TRUNCATE cache_event_listeners_houston;
    TRUNCATE cache_tree_dallas;
    TRUNCATE cache_event_listeners_dallas;
    TRUNCATE cache_tree_austin;
    TRUNCATE cache_event_listeners_austin;
    
    INSERT INTO cache_names (id, name) VALUES (1, 'cache.enabled');
END ;;
DELIMITER ;



DROP PROCEDURE IF EXISTS cache_disable;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE cache_disable()
    COMMENT 'disable cache tables'
BEGIN
    TRUNCATE cache_names;
    TRUNCATE cache_tree_houston;
    TRUNCATE cache_event_listeners_houston;
    TRUNCATE cache_tree_dallas;
    TRUNCATE cache_event_listeners_dallas;
    TRUNCATE cache_tree_austin;
    TRUNCATE cache_event_listeners_austin;
END ;;
DELIMITER ;
