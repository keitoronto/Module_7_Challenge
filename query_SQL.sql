-- Create view for showing the transactions of each cardholder
CREATE VIEW transactions_per_cardholder AS
SELECT c.name, b.cardholder_id, a.card_num, a.transaction_id,a.date,amount,a.merchant_id FROM transaction a
INNER JOIN credit_card b ON a.card_num = b.card_num
INNER JOIN card_holder c ON b.cardholder_id = c.cardholder_id
ORDER BY name ASC;

-- Create view for Counting the transactions that are less than $2.00 per cardholder
CREATE VIEW transactions_less_than_2dollars AS
SELECT COUNT(b.cardholder_id) number_of_tran_per_cardholder, b.cardholder_id 
FROM transaction a
INNER JOIN credit_card b ON a.card_num = b.card_num
INNER JOIN card_holder c ON b.cardholder_id = c.cardholder_id
WHERE amount < 2
GROUP BY b.cardholder_id
ORDER BY COUNT(b.cardholder_id) DESC;

-- Create view to check the top 5 highest transactions that are less than $2.00
CREATE VIEW top5tran_less_than_2dollars AS
SELECT c.name, b.cardholder_id, a.card_num, a.transaction_id,a.date,amount,a.merchant_id FROM transaction a
INNER JOIN credit_card b ON a.card_num = b.card_num
INNER JOIN card_holder c ON b.cardholder_id = c.cardholder_id
WHERE amount < 2 AND
b.cardholder_id in (12,19,24,11,10)
ORDER BY name ASC;

-- Any evidence to suggest that a credit card has been hacked
-- Investigated as shown below. However, there is no clear evidence to suggest any fradulent activities.

-- Further investigation
-- Top 100 hightest transactions made between 7:00 am and 9:00 am 
CREATE VIEW top_100_btwn_7_and_9 AS
SELECT c.name, b.cardholder_id, a.card_num, a.transaction_id,a.date,amount,a.merchant_id,d.merchant_name,d.merchant_category_id,e.merch_category_name 
FROM transaction a
INNER JOIN credit_card b ON a.card_num = b.card_num
INNER JOIN card_holder c ON b.cardholder_id = c.cardholder_id
INNER JOIN merchant d ON a.merchant_id = d.merchant_id
INNER JOIN merchant_category e ON d.merchant_category_id = e.merchant_category_id
WHERE TO_CHAR(date, 'HH24:MI:SS') BETWEEN '07:00:00' AND '09:00:00'
ORDER BY amount DESC LIMIT 100;

-- Do you see any anomalous transactions that could be fradulent?
-- So far, there is no anomalous transactions, continue investigating...

-- Is there a higher number of fradulent transactions made during this time frame versus the rest of the day?
CREATE VIEW num_of_trn_per_hour AS
SELECT EXTRACT(HOUR FROM date) as hour, count(*) number_of_transactions
FROM transaction
WHERE amount < 2
GROUP BY hour
ORDER BY hour;

-- There are no particular hour that number of transactions surge

-- Create view for top 5 merchants prone to being hacked using small transactions?
CREATE VIEW top_5_merch_in_small_trans AS
SELECT COUNT(d.merchant_name), d.merchant_name 
FROM transaction a
INNER JOIN merchant d ON a.merchant_id = d.merchant_id
WHERE amount < 2
GROUP BY d.merchant_name
ORDER BY COUNT(d.merchant_name) DESC LIMIT 5;
