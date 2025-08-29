-- Setup (database + table + load)
# Purpose: Creates database and customers table

-- Create database
CREATE DATABASE IF NOT EXISTS churn_project;
USE churn_project;

-- Drop old table if re-running
DROP TABLE IF EXISTS customers;

-- Create customers table (schema matches Churn.csv after skipping RowNumber)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    surname VARCHAR(50),
    credit_score INT,
    geography VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure INT,
    balance FLOAT,
    num_of_products INT,
    has_cr_card TINYINT,
    is_active_member TINYINT,
    estimated_salary FLOAT,
    exited TINYINT
);

# Loads Churn.csv data into customers table
# Assumes Churn.csv is in ./data/ folder
# First column (RowNumber) is skipped


LOAD DATA LOCAL INFILE './data/Churn.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@row_number, customer_id, surname, credit_score, geography, gender, age, tenure,
 balance, num_of_products, has_cr_card, is_active_member, estimated_salary, exited)
 ;