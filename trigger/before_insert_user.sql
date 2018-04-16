DROP TRIGGER IF EXISTS before_insert_user;

DELIMITER ;;
CREATE DEFINER=web@localhost TRIGGER before_insert_user BEFORE INSERT ON users FOR EACH ROW
BEGIN
    DECLARE $count INT DEFAULT NULL;

    IF NEW.status = 0 THEN
        INSERT INTO spammers (email, ip, time) VALUES (NEW.email, NEW.last_access_ip, NEW.create_time);
        SIGNAL SQLSTATE '02101' SET MESSAGE_TEXT = 'spammer email detected';
    END IF;

    SELECT COUNT(*) INTO $count FROM spammers WHERE email = NEW.email;
    IF $count > 0 THEN
        SIGNAL SQLSTATE '02101' SET MESSAGE_TEXT = 'spammer email detected';
    END IF;

    SELECT COUNT(*) INTO $count FROM users WHERE username = NEW.username;
    IF $count > 0 THEN
        SIGNAL SQLSTATE '02102' SET MESSAGE_TEXT = 'username already exists';
    END IF;

    SELECT COUNT(*) INTO $count FROM users WHERE email = NEW.email;
    IF $count > 0 THEN
        SIGNAL SQLSTATE '02103' SET MESSAGE_TEXT = 'email already exists';
    END IF;
END ;;
DELIMITER ;
