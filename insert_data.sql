-- =======================================================
-- IMPORT DATA INTO TABLE
-- =======================================================

USE credit_card_analysis;

-- Load CSV data (replace file path if needed)
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_card_transactions_ready.csv.csv'
INTO TABLE credit_card_transactions
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@transaction_id, @city, @transaction_date, @card_type, @exp_type, @gender, @amount)
SET  
    transaction_id = TRIM(@transaction_id),
    city = TRIM(@city),
    transaction_date = STR_TO_DATE(TRIM(@transaction_date), '%Y-%m-%d'),
    card_type = TRIM(@card_type),
    exp_type = TRIM(@exp_type),
    gender = TRIM(@gender),
    amount = TRIM(@amount);

-- Confirm total rows imported
SELECT COUNT(*) AS total_rows FROM credit_card_transactions;
