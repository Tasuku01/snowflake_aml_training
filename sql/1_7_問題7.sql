/*******************
顧客ごとの最新取引


（自分の解答）
SELECT
    c.customer_id,
    c.customer_name,
    t.txn_date,
    t.amount,
    ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY t.txn_date DESC) AS row_number
FROM customers c
LEFT OUTER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT OUTER JOIN transactions t
    ON a.account_id = t.account_id
QUALIFY row_number = 1
ORDER BY customer_id
;

********************/

SELECT
    c.customer_id,
    c.customer_name,
    t.txn_id,
    t.txn_date,
    t.amount
FROM customers c
LEFT OUTER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT OUTER JOIN transactions t
    ON a.account_id = t.account_id
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY c.customer_id 
    ORDER BY t.txn_id DESC, t.txn_date DESC
    ) = 1
ORDER BY customer_id
;