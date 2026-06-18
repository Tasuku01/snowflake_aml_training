/*******************
問い合わせ内容

Yamadaに発生したHIGH_VALUE_TRANSFERアラートは妥当ですか？

(自分の解答)

アラート定義を確認したところ、
HIGH_VALUE_TRANSFERは100万円以上の送金で発生する設定でした。

Yamada様は1,500,000円の送金実績が確認できました。

閾値を超過しているため、
アラート発生は妥当と判断します。

********************/

SELECT 
    c.customer_name,
    t.amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE c.customer_name = 'Yamada'
;