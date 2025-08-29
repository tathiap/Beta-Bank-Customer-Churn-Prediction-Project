#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
from sqlalchemy import create_engine


# In[ ]:


# Connect to MySQL (adjust credentials as needed)
engine = create_engine("mysql+pymysql://root:yourpassword@localhost/churn_project")

# Read the feature store table
df = pd.read_sql("SELECT * FROM churn_analytics.feature_store;", engine)

# Separate features and target
X = df.drop(columns=["label", "customer_id"])
y = df["label"]

print("Shape of dataset:", X.shape, y.shape)

