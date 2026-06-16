/*******************
同日に複数回送金した顧客


（自分の解答）
SELECT
    c.customer_id,
    c.customer_name,
    t.txn_date,
    COUNT(*) AS txn_count
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.customer_name, t.txn_date
HAVING COUNT(*) > 1
;

********************/
SELECT
    c.customer_id,
    c.customer_name,
    t.txn_date,
    COUNT(*) AS txn_count
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.txn_type = 'TRANSFER'
GROUP BY c.customer_id, c.customer_name, t.txn_date
HAVING COUNT(*) > 1
;