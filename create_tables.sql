-- =======================================================
-- CREATE DATABASE & TABLE
-- =======================================================

CREATE DATABASE IF NOT EXISTS credit_card_analysis;

USE credit_card_analysis;

-- Create table with proper column names and types
CREATE TABLE IF NOT EXISTS credit_card_transactions (
    transaction_id INT PRIMARY KEY,
    city VARCHAR(50),
    transaction_date DATE,
    card_type VARCHAR(20),
    exp_type VARCHAR(50),
    gender CHAR(1),
    amount DECIMAL(10,2)
);

-- Optional: check table structure
DESCRIBE credit_card_transactions;
