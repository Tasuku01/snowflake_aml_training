/*******************
問い合わせ内容

運用担当から以下の情報が来ました。

MULTIPLE_TRANSFERS

旧ルール
同日3回以上

新ルール
同日5回以上

しかしalert_rulesにはまだ

3回

が登録されています。

(自分の解答)

1_調査SQL 
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
GROUP BY c.customer_name, t.txn_date; 

2_調査結果
CUSTOMER_NAME TXN_DATE TXN_COUNT
Nakamura 2025-05-10 3 

3_ユーザーへの報告文
調査の結果、 
システム上のMULTIPLE_TRANSFERSの閾値は「同日3回以上の送金」に設定されていました。 
一方、新ルールの変更により、業務ルール上の閾値は「同日5回以上の送金」に変更されていることを確認しました。
対象顧客の同日の送金回数は3回であり、新ルールでは閾値未満です。
そのため、本件アラートは ルール変更がシステムへ反映されていないことによる
誤検知の可能性があります。

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