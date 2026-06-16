/*******************
高リスク国への送金一覧を取得


（自分の解答）

SELECT
    c.customer_name,
    t.txn_date,
    t.amount,
    t.destination_country
FROM transactions t
INNER JOIN accounts a
    ON t.account_id = a.account_id
INNER JOIN customers c
    ON a.customer_id = c.customer_id
WHERE t.destination_country IN ('UAE', 'Hong Kong', 'Cayman Islands')
;

********************/

SELECT
    c.customer_name,
    t.txn_date,
    t.amount,
    t.destination_country
FROM transactions t
INNER JOIN accounts a
    ON t.account_id = a.account_id
INNER JOIN customers c
    ON a.customer_id = c.customer_id
WHERE t.destination_country IN ('UAE', 'Hong Kong', 'Cayman Islands')
;