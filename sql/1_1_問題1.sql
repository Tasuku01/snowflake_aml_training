/*******************
顧客ごとの総送金額を集計

自分の解答では
ORDER BY c.customer_id, c.customer_name
と書いていたが、c.customer_nameは不要
********************/

SELECT
    c.customer_id,
    c.customer_name,
    SUM(t.amount) AS total_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id
;
