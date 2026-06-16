/*******************
アラートが発生していない顧客一覧

"OUTER" は省略できる

（自分の解答）

SELECT
    c.customer_id,
    c.customer_name,
    c.country,
    c.risk_level
FROM customers c
LEFT OUTER JOIN aml_alerts al
    ON c.customer_id = al.customer_id
WHERE al.alert_id IS NULL
ORDER BY c.customer_id
;

********************/
SELECT
    c.customer_id,
    c.customer_name,
    c.country,
    c.risk_level
FROM customers c
LEFT JOIN aml_alerts al
    ON c.customer_id = al.customer_id
WHERE al.alert_id IS NULL
ORDER BY c.customer_id
;