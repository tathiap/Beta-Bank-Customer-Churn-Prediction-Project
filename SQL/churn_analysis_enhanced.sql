-- Analytics Schema & KIPs 
# Builds churn_analytics schema and runs KPI queries

USE churn_project;

-- Create schema
CREATE SCHEMA IF NOT EXISTS churn_analytics;

-- Churn summary table
CREATE TABLE IF NOT EXISTS churn_analytics.churn_summary AS
SELECT geography,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY geography;

-- KPI Queries

-- Overall churn rate
SELECT 
    ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS overall_churn_rate
FROM customers;

-- Churn by geography
SELECT geography, churn_rate
FROM churn_analytics.churn_summary
ORDER BY churn_rate DESC;

-- Churn by number of products
SELECT num_of_products,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY num_of_products
ORDER BY churn_rate DESC;

-- Average balance and salary for churned vs non-churned
SELECT exited,
       ROUND(AVG(balance), 2) AS avg_balance,
       ROUND(AVG(estimated_salary), 2) AS avg_salary
FROM customers
GROUP BY exited;

-- Churn by age groups
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
ORDER BY churn_rate DESC;

-- Churn by active membership
SELECT is_active_member, 
       COUNT(*) AS total_customers,
       SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY is_active_member;

-- Top 5 regions with highest churn rate
SELECT geography, churn_rate
FROM churn_analytics.churn_summary
ORDER BY churn_rate DESC
LIMIT 5;
