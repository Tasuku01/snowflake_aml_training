/*******************
問い合わせ内容

ユーザーから

「Yamadaさんのアラートは誤検知ではないですか？」

と問い合わせがありました。

アラートの妥当性を調査してください。


(自分の解答)
SQLは問題無し。妥当性の説明はできず。

妥当性の模範解答は以下。

顧客Yamadaについて調査した結果、

・HIGH_VALUE_TRANSFERアラートが発生
・2025-05-01に1,500,000円の送金実績を確認
・送金種別はTRANSFER
・送金先はUAE

高額送金に該当する取引が確認できたため、
アラート発生は妥当であり、誤検知とは判断できません。

********************/

SELECT 
    c.customer_id,
    c.customer_name,
    a.account_id,
    al.alert_id,
    al.alert_type,
    al.alert_date,
    t.txn_date,
    t.amount,
    t.txn_type,
    t.destination_country
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN aml_alerts al
    ON c.customer_id = al.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE c.customer_id = 4
;