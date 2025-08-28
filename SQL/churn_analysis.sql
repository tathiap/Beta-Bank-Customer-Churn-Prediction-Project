-- Churn Analytics
-- Creates schema, summary table, and KPIs

#Use the churn_project database
USE churn_project
;

# Create a schema to hold KPI tables 
CREATE SCHEMA IF NOT EXISTS churn_analytics
;

# Create a churn summary table
CREATE TABLE IF NOT EXISTS churn_analytics.churn_summary (
    geography VARCHAR(50),
    total_customers INT,
    churned_customers INT,
    churn_rate FLOAT
)
;

# Populate churn summary table
INSERT INTO churn_analytics.churn_summary (geography, total_customers, churned_customers, churn_rate)
SELECT geography,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY geography
;

-- KPI Queries 

# Overall Churn Rate
SELECT 
    ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS overall_churn_rate
FROM customers
;

# Churn by Geography
SELECT geography, churn_rate
FROM churn_analytics.churn_summary
ORDER BY churn_rate DESC
;

# Churn by Number of Products
SELECT num_of_products,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY num_of_products
ORDER BY churn_rate DESC
;

# Average Balance and Salary for Churned vs Non-Churned
SELECT exited,
       ROUND(AVG(balance), 2) AS avg_balance,
       ROUND(AVG(estimated_salary), 2) AS avg_salary
FROM customers
GROUP BY exited
;

# Churn by Age Groups
SELECT CASE
          WHEN age < 30 THEN 'Under 30'
          WHEN age BETWEEN 30 AND 50 THEN '30-50'
          ELSE 'Over 50'
       END AS age_group,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY age_group
ORDER BY churn_rate DESC
;

# Churn by Active Membership 
SELECT is_active_member, 
	COUNT(*) AS tota_customers,
    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) 
    ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY is_active_member
;

# Top 5 Regions with Highest Churn Rate
SELECT geography,
       churn_rate
FROM churn_analytics.churn_summary
ORDER BY churn_rate DESC
LIMIT 5
;
