DROP TRIGGER IF EXISTS before_insert_user;

DELIMITER ;;
CREATE DEFINER=web@localhost TRIGGER before_insert_user BEFORE INSERT ON users FOR EACH ROW
BEGIN
    DECLARE $count INT DEFAULT NULL;

    IF NEW.status = 0 THEN
        INSERT INTO spammers (email, time) VALUES (NEW.email, NEW.create_time);
        SIGNAL SQLSTATE '02101' SET MESSAGE_TEXT = '此邮箱没有通过系统的安全检测。';
    END IF;

    SELECT COUNT(*) INTO $count FROM spammers WHERE email = NEW.email;
    IF $count > 0 THEN
        SIGNAL SQLSTATE '02101' SET MESSAGE_TEXT = '此邮箱没有通过系统的安全检测。';
    END IF;

    SELECT COUNT(*) INTO $count FROM users WHERE email = NEW.email;
    IF $count > 0 THEN
        SIGNAL SQLSTATE '02103' SET MESSAGE_TEXT = '此邮箱已被其他用户使用。';
    END IF;
END ;;
DELIMITER ;
