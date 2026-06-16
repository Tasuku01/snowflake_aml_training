/*******************
100万円以上の送金を行った顧客を抽出

（自分の解答）
SELECT
    c.customer_name,
    a.account_id,
    t.amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.txn_type = 'TRANSFER' AND t.amount >= 1000000
;

********************/

SELECT
    c.customer_id,
    c.customer_name,
    a.account_id,
    t.txn_id,
    t.amount,
    t.destination_country
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.txn_type = 'TRANSFER' 
    AND t.amount >= 1000000
ORDER BY t.amount DESC;
;