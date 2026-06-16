/*******************
アラートが発生した顧客一覧

（自分の解答）

SELECT
    c.customer_id,
    al.alert_id,
    c.customer_name,
    al.alert_type,
    al.alert_date
FROM customers c
INNER JOIN aml_alerts al
    ON c.customer_id = al.customer_id
ORDER BY c.customer_id
;

********************/

SELECT
    c.customer_id,
    c.customer_name,
    c.risk_level,
    al.alert_id,
    al.alert_type,
    al.alert_date
FROM customers c
INNER JOIN aml_alerts al
    ON c.customer_id = al.customer_id
ORDER BY c.customer_id
;