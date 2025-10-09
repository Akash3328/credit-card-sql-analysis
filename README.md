# 💳 Credit Card Transactions SQL Project

## 📘 Overview
This SQL project analyzes **credit card transactions across Indian cities** to uncover spending habits, high-value markets, and card performance trends.  
The project focuses on **data cleaning, exploration, and analytical SQL queries** using **MySQL Workbench**.

---

## 🧠 Project Objectives
1. Clean and import real-world transactional data into SQL Server/MySQL.
2. Explore data to understand trends in spending, card usage, and demographics.
3. Solve 10+ real business questions using advanced SQL concepts:
   - Aggregations (SUM, AVG, COUNT)
   - Window functions
   - Date and time functions
   - Cumulative sums
   - Ranking and filtering

---

## ⚙️ Tools & Skills Used
- **Database:** MySQL Workbench  
- **Language:** SQL  
- **Concepts Covered:**
  - Data cleaning and preprocessing
  - Joins, subqueries, and CTEs
  - Window functions (`RANK()`, `SUM() OVER()`)
  - Date extraction (`MONTH()`, `DAYOFWEEK()`)
  - Aggregation and percentage calculations

---

## 📂 Folder Structure
credit-card-sql-analysis/
│
├── Credit card transactions - India - Simple.csv # Original dataset
├── create_tables.sql # Table creation script
├── insert_data.sql # Data insertion/import
├── analysis_queries.sql # All business queries
└── README.md # Documentation file




---

## 🧩 Step 3: Data Exploration (EDA)

### 🎯 Objective:
Before solving business queries, explore and understand the dataset — identify its structure, size, data range, and key patterns.

| Metric | Example Output |
|---------|----------------|
| Total Records | 25,000 |
| Unique Cities | 50 |
| Unique Card Types | 4 (Gold, Silver, Platinum, Signature) |
| Unique Expense Types | 10 |
| Gender Distribution | M/F |
| Date Range | Jan 2013 – Dec 2014 |
| Total Spend | ₹212M |
| Average Transaction | ₹8,500 |

✅ *EDA confirmed dataset quality and completeness (no missing values).*

---

## 💼 Business Problems Solved
Below are some sample queries from the project:

1. **Top 5 Cities by Total Spends and % Contribution**  
2. **Highest Spend Month and Amount by Card Type**  
3. **Cumulative Spend of ₹1,000,000 per Card Type**  
4. **Lowest % Spend for Gold Card by City**  
5. **City-wise Highest and Lowest Expense Type**  
6. **Female Spend % by Expense Type**  
7. **Card + Expense Type with Highest MoM Growth (Jan 2014)**  
8. **Weekend Spend-to-Transaction Ratio by City**  
9. **Fastest City to Reach 500th Transaction**

All queries are included in:  
`analysis_queries.sql`

---

## 📊 Key Insights
- **Mumbai & Delhi** lead total credit card spends across India.  
- **Fuel** and **Bills** are top expense categories.  
- **Females contribute 35–45%** of total spending in most categories.  
- **Platinum cards** show highest growth in 2014.  
- **Pune** reached its 500th transaction fastest among all cities.

---

## 🧱 SQL Concepts Practiced
| Concept | Example |
|----------|----------|
| Aggregation | `SUM(amount)` |
| Window Function | `SUM(amount) OVER (PARTITION BY card_type ORDER BY transaction_date)` |
| Ranking | `RANK() OVER (ORDER BY total_spent DESC)` |
| Date Function | `MONTH(transaction_date)` |
| Filtering | `WHERE card_type = 'Gold'` |

---

## 📈 Project Timeline
| Step | Description | Time |
|------|--------------|------|
| 1 | Setup & Familiarization | 0.5 day |
| 2 | Data Cleaning & Import | 1 day |
| 3 | Data Exploration (EDA) | 1 day |
| 4 | Solve 10 Business Queries | 2 days |
| 5 | Write Insights + README | 1 day |
| 6 | Push to GitHub | 0.5 day |

---

## 📎 References
- [Dataset Source (Kaggle)](https://www.kaggle.com/datasets/thedevastator/analyzing-credit-card-spending-habits-in-india)  
- MySQL Documentation: [Window Functions](https://dev.mysql.com/doc/refman/8.0/en/window-functions.html)

---

## 👨‍💻 Author
**Akash Odedara**  
🎓 SQL | Backend Development | Full Stack Learner  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/akash-odedara/)  
📁 [GitHub Projects](https://github.com/Akash3328)

---
