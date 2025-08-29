--  Feature store
# Creates a feature store table for ML handoff
-- Notes:
#  Feature store tables are used by Data Science teams

USE churn_project;

-- Drop if exists (so script can be re-run safely)
DROP TABLE IF EXISTS churn_analytics.feature_store;

-- Create feature store table
CREATE TABLE churn_analytics.feature_store AS
SELECT 
    customer_id,
    geography,
    gender,
    age,
    tenure,
    balance,
    num_of_products,
    has_cr_card,
    is_active_member,
    estimated_salary,
    exited AS label, -- target variable for ML

    -- Engineered Features
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS age_group,

    CASE
        WHEN balance = 0 THEN 1 ELSE 0
    END AS is_zero_balance,

    CASE
        WHEN tenure >= 5 THEN 1 ELSE 0
    END AS long_tenure_flag,

    ROUND(balance / NULLIF(estimated_salary,0), 2) AS balance_to_salary_ratio

FROM customers;
