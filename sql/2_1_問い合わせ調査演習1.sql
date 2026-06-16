/*******************
問い合わせ内容

顧客「Nakamura」について確認したいです。

AMLアラートが発生していますが、
本当に同日に複数回送金しているのでしょうか？

送金実績を調査してください。


(自分の解答)

SELECT
    customer_name,
    txn_id,
    txn_date,
    amount,
    destination_country
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE customer_name = 'Nakamura'
;

********************/

SELECT
    c.customer_id,
    c.customer_name,
    t.txn_id,
    t.txn_date,
    t.amount,
    t.destination_country
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE c.customer_id = 7
    AND t.txn_type = 'TRANSFER'
ORDER BY t.txn_date DESC, t.txn_id DESC
;