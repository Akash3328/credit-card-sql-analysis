 3️⃣ STEP 3: DATA EXPLORATION (EDA)
-- =======================================================

-- Step 3.1 — Basic Info: Row Count & Preview
SELECT COUNT(*) AS total_records 
FROM credit_card_transactions;

SELECT * 
FROM credit_card_transactions
LIMIT 10;

-- Step 3.2 — Unique Values
SELECT 
    COUNT(DISTINCT city) AS unique_cities,
    COUNT(DISTINCT card_type) AS unique_card_types,
    COUNT(DISTINCT exp_type) AS unique_expense_types,
    COUNT(DISTINCT gender) AS unique_genders
FROM credit_card_transactions;

-- Step 3.3 — Date Range Check
SELECT 
    MIN(transaction_date) AS start_date,
    MAX(transaction_date) AS end_date
FROM credit_card_transactions;

-- Step 3.4 — Spend Summary Statistics
SELECT 
    MIN(amount) AS min_spend,
    MAX(amount) AS max_spend,
    AVG(amount) AS avg_spend,
    SUM(amount) AS total_spend
FROM credit_card_transactions;

-- Step 3.5 — City and Card Distribution
SELECT city, COUNT(*) AS total_transactions, SUM(amount) AS total_spent
FROM credit_card_transactions
GROUP BY city
ORDER BY total_spent DESC
LIMIT 10;

-- Step 3.6 — Missing Values Check
SELECT 
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN transaction_date IS NULL THEN 1 ELSE 0 END) AS missing_transaction_date,
    SUM(CASE WHEN card_type IS NULL THEN 1 ELSE 0 END) AS missing_card_type,
    SUM(CASE WHEN exp_type IS NULL THEN 1 ELSE 0 END) AS missing_exp_type,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS missing_amount
FROM credit_card_transactions;
