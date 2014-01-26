DROP TRIGGER IF EXISTS before_insert_node;

DELIMITER ;;
CREATE DEFINER=web@localhost TRIGGER before_insert_node BEFORE INSERT ON nodes FOR EACH ROW
BEGIN
	DECLARE $uid INT DEFAULT NULL;
	DECLARE $count INT DEFAULT NULL;
	SELECT id INTO $uid FROM users WHERE id = NEW.uid AND status > 0;
	IF $uid IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'user not found';
	END IF;

	DROP TEMPORARY TABLE IF EXISTS create_time_t;
    CREATE TEMPORARY TABLE create_time_t (
        create_time INT(11) UNSIGNED
    ) ENGINE=MEMORY;
    INSERT INTO create_time_t SELECT create_time FROM nodes WHERE uid = NEW.uid AND create_time > (NEW.create_time - 43200) ORDER BY create_time DESC;

	SELECT COUNT(*) INTO $count FROM create_time_t;
	IF $count > 0 THEN
		IF $count > 5 THEN
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'too many new topics within 12 hours';
		ELSE
			SELECT COUNT(*) INTO $count FROM create_time_t WHERE create_time > (NEW.create_time - 1800);
			IF $count > 0 THEN
				IF $count > 2 THEN
					SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'too many new topics within 30 minutes';
				ELSE
					SELECT COUNT(*) INTO $count FROM create_time_t WHERE create_time > (NEW.create_time - 180);
					IF $count > 0 THEN
						SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'too many new topics within 3 minutes';
					END IF;
				END IF;
			END IF;
		END IF;
	END IF;

	DROP TEMPORARY TABLE create_time_t;

	SELECT count(*) INTO $count FROM nodes WHERE hash = CRC32(NEW.body) AND uid = NEW.uid AND create_time > (NEW.create_time - 86400);
	IF $count > 0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'duplicate node found';
	END IF;
END ;;
DELIMITER ;
