/*******************
問い合わせ内容

NakamuraのMULTIPLE_TRANSFERSは誤検知では？

(自分の解答)

Nakamuraは、2025-05-10に合計3回送金しているので
誤検知ではありません。

SELECT
    c.customer_id,
    c.customer_name,
    t.txn_date,
    count(*) as txn_count
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.customer_name, t.txn_date
HAVING c.customer_id = 7

********************/

SELECT
    c.customer_name,
    t.txn_date,
    COUNT(*) AS txn_count
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE c.customer_name = 'Nakamura'
GROUP BY
    c.customer_name,
    t.txn_date;