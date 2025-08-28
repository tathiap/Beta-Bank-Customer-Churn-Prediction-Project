#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from sqlalchemy import create_engine


# In[2]:


# Connect to MySQL (update PASSWORD if needed)
engine = create_engine("mysql+mysqlconnector://root:September97!@localhost/churn_project")


# In[3]:


# Read data from the customers table
df = pd.read_sql("SELECT * FROM customers", con=engine)


# In[4]:


# Save to CSV
csv_path = "/Users/tathianicol/Desktop/Analyst/customers_export.csv"
df.to_csv(csv_path, index=False)

print(f"Data successfully exported to: {csv_path}")


# In[ ]:




