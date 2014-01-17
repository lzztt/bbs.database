DROP PROCEDURE IF EXISTS get_ad_payments;

DELIMITER ;;
CREATE DEFINER=web@localhost PROCEDURE get_ad_payments(IN $time INT)
    COMMENT 'get payment history for current active ads'  
BEGIN
	SELECT p.id, a.name, p.amount, p.time AS pay_time, a.exp_time, p.comment 
	FROM ad_payments AS p LEFT JOIN ads AS a ON p.ad_id = a.id 
	WHERE p.ad_id IN ( SELECT DISTINCT(id) FROM ads WHERE exp_time > $time ) ORDER BY p.time DESC;
END ;;
DELIMITER ;
