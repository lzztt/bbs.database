DROP PROCEDURE IF EXISTS update_view_count_single;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE update_view_count_single(IN $sid VARCHAR(32))
    COMMENT 'update view count'
BEGIN
    DECLARE $count INT;

    SELECT COUNT(*) INTO $count FROM ff_counts WHERE sid = $sid;
    IF $count = 0 THEN
        INSERT INTO ff_counts (sid, count) VALUES ($sid, 1);
    ELSE
        UPDATE ff_counts SET count = count + 1 WHERE sid = $sid;
    END IF;
END ;;
DELIMITER ;
