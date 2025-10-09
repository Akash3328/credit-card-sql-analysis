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




-- =======================================================
-- STEP 4: BUSINESS CASE QUERIES
-- =======================================================

-- Q1: Top 5 cities with highest spends and % contribution
SELECT city,
       SUM(amount) AS total_spent,
       ROUND(SUM(amount) / (SELECT SUM(amount) FROM credit_card_transactions) * 100, 2) AS percent_contribution
FROM credit_card_transactions
GROUP BY city
ORDER BY total_spent DESC
LIMIT 5;

-- Q2: Highest spend month and amount for each card type
SELECT card_type,
       DATE_FORMAT(transaction_date, '%Y-%m') AS month,
       SUM(amount) AS total_spent
FROM credit_card_transactions
GROUP BY card_type, month
ORDER BY card_type, total_spent DESC;

-- Q3: Transaction details for each card type when cumulative reaches 1,000,000
SELECT *
FROM (
    SELECT *,
           SUM(amount) OVER(PARTITION BY card_type ORDER BY transaction_date) AS cumulative_amount,
           ROW_NUMBER() OVER(PARTITION BY card_type ORDER BY transaction_date) AS rn
    FROM credit_card_transactions
) t
WHERE cumulative_amount >= 1000000 AND rn = 1;


-- Q4: City with lowest percentage spend for Gold card
SELECT city,
       SUM(amount) AS gold_spend,
       ROUND(SUM(amount)/ (SELECT SUM(amount) FROM credit_card_transactions WHERE card_type='Gold')*100, 2) AS percent
FROM credit_card_transactions
WHERE card_type='Gold'
GROUP BY city
ORDER BY percent ASC
LIMIT 1;

-- Q5: City, highest_expense_type, lowest_expense_type
-- Step 1: Calculate total spend per city and expense type
WITH city_expense AS (
    SELECT city, exp_type, SUM(amount) AS total_amount
    FROM credit_card_transactions
    GROUP BY city, exp_type
)

-- Step 2: Pick highest and lowest expense type per city
SELECT 
    c.city,
    (SELECT exp_type 
     FROM city_expense ce 
     WHERE ce.city = c.city 
     ORDER BY total_amount DESC 
     LIMIT 1) AS highest_expense_type,
    (SELECT exp_type 
     FROM city_expense ce 
     WHERE ce.city = c.city 
     ORDER BY total_amount ASC 
     LIMIT 1) AS lowest_expense_type
FROM (SELECT DISTINCT city FROM credit_card_transactions) c;


-- Q6: Percentage contribution of spends by females for each expense type
SELECT exp_type,
       ROUND(SUM(CASE WHEN gender='F' THEN amount ELSE 0 END) / SUM(amount) * 100, 2) AS female_percent
FROM credit_card_transactions
GROUP BY exp_type;

-- Q7: Card & expense type combination with highest spend in Jan-2014
SELECT card_type, exp_type,
       SUM(amount) AS jan_2014_amount
FROM credit_card_transactions
WHERE YEAR(transaction_date)=2014 AND MONTH(transaction_date)=1
GROUP BY card_type, exp_type
ORDER BY jan_2014_amount DESC
LIMIT 1;

-- Q9: Weekend city with highest spend/transaction ratio
SELECT city,
       SUM(amount)/COUNT(*) AS spend_per_transaction
FROM credit_card_transactions
WHERE DAYOFWEEK(transaction_date) IN (1,7)
GROUP BY city
ORDER BY spend_per_transaction DESC
LIMIT 1;

-- Q10: City that took the least number of days to reach 500th transaction
SELECT city, DATEDIFF(MAX(transaction_date), MIN(transaction_date)) AS days_to_500
FROM (
    SELECT city, transaction_date,
           ROW_NUMBER() OVER(PARTITION BY city ORDER BY transaction_date) AS txn_no
    FROM credit_card_transactions
) t
WHERE txn_no=500
GROUP BY city
ORDER BY days_to_500 ASC
LIMIT 1;

