/*******************
旧システム

MULTIPLE_TRANSFERS

同日3回以上

新システム

MULTIPLE_TRANSFERS

同日5回以上
調査依頼

検証担当から

アラート対象顧客に差異があるか確認してください

1_旧システム対象顧客を抽出するSQL

SELECT 
    c.customer_id,
    c.customer_name,
    t.txn_date,
    COUNT(*) AS txn_count,
    SUM(t.amount) as amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.txn_type = 'TRANSFER'
GROUP BY c.customer_id, c.customer_name, t.txn_date
HAVING COUNT(*) >= 3
;

2_新システム対象顧客を抽出するSQL

SELECT 
    c.customer_id,
    c.customer_name,
    t.txn_date,
    COUNT(*) AS txn_count,
    SUM(t.amount) as amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.txn_type = 'TRANSFER'
GROUP BY c.customer_id, c.customer_name, t.txn_date
HAVING COUNT(*) >= 5
;

3_差異抽出SQL

********************/
WITH old_system AS(
    SELECT 
        c.customer_id,
        c.customer_name,
        t.txn_date,
        COUNT(*) AS txn_count,
        SUM(t.amount) as amount
    FROM customers c
    INNER JOIN accounts a
        ON c.customer_id = a.customer_id
    INNER JOIN transactions t
        ON a.account_id = t.account_id
    WHERE t.txn_type = 'TRANSFER'
    GROUP BY c.customer_id, c.customer_name, t.txn_date
    HAVING COUNT(*) >= 3
), 
new_system AS(
    SELECT 
        c.customer_id,
        c.customer_name,
        t.txn_date,
        COUNT(*) AS txn_count,
        SUM(t.amount) as amount
    FROM customers c
    INNER JOIN accounts a
        ON c.customer_id = a.customer_id
    INNER JOIN transactions t
        ON a.account_id = t.account_id
    WHERE t.txn_type = 'TRANSFER'
    GROUP BY c.customer_id, c.customer_name, t.txn_date
    HAVING COUNT(*) >= 5
)
SELECT
    *
FROM old_system
MINUS
SELECT
    *
FROM new_system
;
