# Create database (only run if it doesn't exist)
CREATE DATABASE IF NOT EXISTS churn_project;

# Use the database
USE churn_project;

# Create the customers table
CREATE TABLE IF NOT EXISTS customers (
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

# Load the churn CSV data into the table
# IMPORTANT: Update the file path to where your Churn.csv is located.
LOAD DATA LOCAL INFILE '/Users/tathianicol/Desktop/Analyst/Beta Bank Churn/Churn.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, surname, credit_score, geography, gender, age, tenure, balance, num_of_products, has_cr_card, is_active_member, estimated_salary, exited);

# Check row count
SELECT COUNT(*) FROM customers;

# Check first 10 rows
SELECT * FROM customers LIMIT 10;
