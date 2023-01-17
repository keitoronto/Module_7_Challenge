-- Module 7 Challenge
-- Check DB existance and drop it if exists
DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;

-- Create Tables
-- card_holder table
CREATE TABLE card_holder(
	cardholder_id INT NOT NULL PRIMARY KEY, -- ONE to MANY
	name VARCHAR
);

-- credit_card table
CREATE TABLE credit_card(
	card_num VARCHAR NOT NULL PRIMARY KEY,
	cardholder_id INT NOT NULL,
	FOREIGN KEY(cardholder_id) REFERENCES card_holder(cardholder_id) -- MANY to ONE
);

-- merchant_category
CREATE TABLE merchant_category(
	merchant_category_id INT NOT NULL PRIMARY KEY, -- ONE to MANY
	merch_category_name VARCHAR
);

-- merchant
CREATE TABLE merchant(
	merchant_id INT NOT NULL PRIMARY KEY, -- ONE to MANY
	merchant_name VARCHAR,
	merchant_category_id INT NOT NULL,
	FOREIGN KEY(merchant_category_id) REFERENCES merchant_category(merchant_category_id) -- ONE to MANY
);

-- transaction
CREATE TABLE transaction(
	transaction_id INT NOT NULL PRIMARY KEY,
	date TIMESTAMP,
	amount FLOAT,
	card_num VARCHAR NOT NULL,
	merchant_id INT NOT NULL,
	FOREIGN KEY(card_num) REFERENCES credit_card(card_num), -- MANY to ONE
	FOREIGN KEY(merchant_id) REFERENCES merchant(merchant_id) -- MANY to ONE
);

-- Check if data is populated into tables
SELECT * FROM card_holder;
SELECT * FROM credit_card;
SELECT * FROM transaction;
SELECT * FROM merchant_category;
SELECT * FROM merchant;



