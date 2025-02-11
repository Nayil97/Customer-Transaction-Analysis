-- Customer Transaction Behavior Analysis using SQL

-- 1. Preview Data
SELECT * FROM transactions LIMIT 10;

-- 2. Customer Transaction Patterns
-- 2.1 Transaction Frequency per Customer
SELECT "Sender Account ID", COUNT(*) AS transaction_count
FROM transactions
GROUP BY "Sender Account ID"
ORDER BY transaction_count DESC
LIMIT 10;

-- 2.2 Average Transaction Amount per Customer
SELECT "Sender Account ID", 
       AVG("Transaction Amount") AS avg_transaction_amount
FROM transactions
GROUP BY "Sender Account ID"
ORDER BY avg_transaction_amount DESC
LIMIT 10;

-- 3. Transaction Type Analysis
-- 3.1 Most Common Transaction Types
SELECT "Transaction Type", COUNT(*) AS type_count
FROM transactions
GROUP BY "Transaction Type"
ORDER BY type_count DESC;

-- 3.2 Transaction Type by Customer
SELECT "Sender Account ID", "Transaction Type", COUNT(*) AS type_count
FROM transactions
GROUP BY "Sender Account ID", "Transaction Type"
ORDER BY "Sender Account ID", type_count DESC;

-- 4. Device & Location Analysis
-- 4.1 Most Used Devices
SELECT "Device Used", COUNT(*) AS usage_count
FROM transactions
GROUP BY "Device Used"
ORDER BY usage_count DESC;

-- 4.2 Transactions by Geolocation
SELECT "Geolocation (Latitude/Longitude)", COUNT(*) AS transaction_count
FROM transactions
GROUP BY "Geolocation (Latitude/Longitude)"
ORDER BY transaction_count DESC
LIMIT 10;

-- 5. Fraud Detection Insights
-- 5.1 Customers with Most Fraudulent Transactions
SELECT "Sender Account ID", COUNT(*) AS fraud_count
FROM transactions
WHERE "Fraud Flag" = TRUE
GROUP BY "Sender Account ID"
ORDER BY fraud_count DESC
LIMIT 10;

-- 5.2 Fraud Rate by Transaction Type
SELECT "Transaction Type", 
       COUNT(*) AS total_transactions, 
       SUM(CASE WHEN "Fraud Flag" = TRUE THEN 1 ELSE 0 END) AS fraud_count,
       (SUM(CASE WHEN "Fraud Flag" = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS fraud_rate
FROM transactions
GROUP BY "Transaction Type"
ORDER BY fraud_rate DESC;
