/*******************
問い合わせ内容

顧客「Abe」に HIGH_RISK_COUNTRY アラートが発生しています。

なぜアラートが発生したのか調査してください。

また、その顧客はPEP顧客かどうかも確認してください。


(自分の解答)
顧客「Abe」　はPEP顧客であり、 
職業はInvestorなので、
投資目的でCayman Islandsへ3,000,000を送金していると考えられます。
この送金がHIGH_RISK_COUNTRY アラートの発生原因と考えられます。


********************/

SELECT
    c.customer_id,
    c.customer_name,
    a.account_id,
    t.txn_id,
    t.txn_date,
    t.amount,
    t.txn_type,
    t.destination_country,
    al.alert_id,
    al.alert_date,
    al.alert_type,
    kyc.occupation,
    kyc.pep_flag
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
INNER JOIN aml_alerts al
    ON c.customer_id = al.customer_id
INNER JOIN customer_kyc kyc
    ON c.customer_id = kyc.customer_id
WHERE c.customer_id = 10
;