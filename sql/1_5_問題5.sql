/*******************
PEP顧客一覧を取得

PEPとは？
Politically Exposed Person
要人・政治的影響力を持つ人物

（自分の解答）
SELECT
    c.customer_id,
    c.customer_name,
    ck.occupation,
    ck.pep_flag
FROM customers c
INNER JOIN customer_kyc ck
    ON c.customer_id = ck.customer_id
WHERE ck.pep_flag = 1
;

********************/

SELECT
    c.customer_id,
    c.customer_name,
    c.risk_level,
    ck.occupation,
    ck.pep_flag
FROM customers c
INNER JOIN customer_kyc ck
    ON c.customer_id = ck.customer_id
WHERE ck.pep_flag = 1
;