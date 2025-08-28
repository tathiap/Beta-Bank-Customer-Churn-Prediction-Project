#!/usr/bin/env python
# coding: utf-8

# Upload Churn Data to MySQL
# --------------------------
# This script:
# 1. Connects to the churn_project database.
# 2. Uploads the Churn.csv dataset to the customers table.
# 3. Verifies the connection and data upload.

# In[5]:


import pandas as pd
from sqlalchemy import create_engine


# In[6]:


# Configuration 
csv_path = '/Users/tathianicol/Desktop/Analyst/Beta Bank Churn/Churn.csv'
mysql_user = 'root'
mysql_password = 'September97!'  # Replace with your MySQL password
mysql_host = 'localhost'
mysql_db = 'churn_project'
table_name = 'customers'


# In[7]:


# Connect to mySQL 
try:
    engine = create_engine(f"mysql+mysqlconnector://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}/{MYSQL_DB}")
    conn = engine.connect()
    print("Connection to MySQL successful!")
    conn.close()
except Exception as e:
    print(f"Connection failed: {e}")
    exit()


# In[ ]:


# Load csv
try:
    df = pd.read_csv(CSV_PATH)
    print(f"CSV file loaded successfully with {df.shape[0]} rows and {df.shape[1]} columns.")
except FileNotFoundError:
    print(f" CSV file not found at {CSV_PATH}. Please check the path.")
    exit()


# In[ ]:


# upload data to mysql 
try:
    df.to_sql(TABLE_NAME, con=engine, if_exists='replace', index=False)
    print(f"Data successfully uploaded to '{TABLE_NAME}' table in '{MYSQL_DB}' database.")
except Exception as e:
    print(f" Data upload failed: {e}")
    exit()


# In[ ]:


# Verify upload
try:
    with engine.connect() as conn:
        result = conn.execute(f"SELECT COUNT(*) FROM {TABLE_NAME}")
        row_count = result.scalar()
        print(f"Table '{TABLE_NAME}' now contains {row_count} rows.")
except Exception as e:
    print(f"Verification failed: {e}")


# In[ ]:




