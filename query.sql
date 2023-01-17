-- Check how many records where amount is less than $2
SELECT COUNT(*) FROM transaction
WHERE amount < 2;

SELECT c.name, b.cardholder_id, a.card_num, a.transaction_id,a.date,amount,a.merchant_id,d.merchant_name,d.merchant_category_id,e.merch_category_name FROM transaction a
INNER JOIN credit_card b ON a.card_num = b.card_num
INNER JOIN card_holder c ON b.cardholder_id = c.cardholder_id
INNER JOIN merchant d ON a.merchant_id = d.merchant_id
INNER JOIN merchant_category e ON d.merchant_category_id = e.merchant_category_id
WHERE amount < 2
ORDER BY amount ASC;

SELECT c.name, b.cardholder_id, a.card_num, a.transaction_id,a.date,amount,a.merchant_id,d.merchant_name,d.merchant_category_id,e.merch_category_name FROM transaction a
INNER JOIN credit_card b ON a.card_num = b.card_num
INNER JOIN card_holder c ON b.cardholder_id = c.cardholder_id
INNER JOIN merchant d ON a.merchant_id = d.merchant_id
INNER JOIN merchant_category e ON d.merchant_category_id = e.merchant_category_id
WHERE amount < 2
ORDER BY name ASC;

SELECT COUNT (DICTINCT name) FROM transaction a
INNER JOIN credit_card b ON a.card_num = b.card_num
INNER JOIN card_holder c ON b.cardholder_id = c.cardholder_id
INNER JOIN merchant d ON a.merchant_id = d.merchant_id
INNER JOIN merchant_category e ON d.merchant_category_id = e.merchant_category_id
WHERE amount < 2
ORDER BY c.name ASC;


SELECT DISTINCT(c.cardholder_id, c.name) FROM transaction a
INNER JOIN credit_card b ON a.card_num = b.card_num
INNER JOIN card_holder c ON b.cardholder_id = c.cardholder_id
WHERE amount >= 2;

SELECT COUNT (*) FROM card_holder;

SElECT * FROM card_holder;

SELECT COUNT (*) FROM transaction;

SELECT DISTINCT(merchant_category_id) FROM merchant
ORDER BY merchant_category_id;

SELECT * FROM merchant_category;