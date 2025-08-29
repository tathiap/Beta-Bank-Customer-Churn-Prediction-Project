# Beta Bank Customer Churn Prediction 

This project analyzes customer churn at Beta Bank using SQL and Python in a production-style workflow. It demonstrates:

* Data engineering with SQL (setup, load, analytics)
* Business KPIs for churn analysis
* Feature store design for ML handoff
* Python integration to train machine learning models using the SQL-generated dataset

## Ojective 

To build a machine learning model that predicts customer churn using historical banking data, enabling the bank to proactively identify at-risk customers and improve retention strategies.


## ML Pipeline Overview

Both versions of the project follow this pipeline:

1. Data Cleaning – Handling nulls and formatting issues
2. EDA (Exploratory Data Analysis) – Analyzing churn by geography, gender, credit score, etc.
3. Feature Engineering – One-hot encoding and numeric transformations
4. Class Imbalance Handling – Upsampling minority class for balanced modeling
5. Modeling – Random Forest Classifier (with GridSearchCV tuning in script version)
6. Evaluation – F1 Score, Confusion Matrix, ROC Curve, Feature Importance


## Tableau Dashboard

The Tableau dashboard highlights:

* Churn Distribution
* Churn by Gender
* Churn by Geography (Percentage-based)

###  View Dashboard
(https://public.tableau.com/app/profile/tathia.primasany/viz/BetaBankCustomerChurnPredicition/Dashboard1?publish=yes)

## Key Insights

* Customers in Germany exhibit the highest churn rate, followed by France and Spain.
* Lower product engagement, fewer active accounts, and lower credit scores are associated with churn.
* After balancing the training set, the Random Forest model achieved an F1 Score of ~0.59, meeting the benchmark.

## Insights on Churn Drivers

The analysis highlights several key drivers of churn at Beta Bank:

  * Age → Customers over 50 show the highest churn rates, while younger customers (<30) are more likely to stay.
  * Balance → Customers with zero account balance are disproportionately at risk, suggesting low engagement.
  * Tenure → Customers with fewer than 5 years at the bank are more likely to churn, reflecting weaker loyalty.
  * Geography → Germany consistently shows higher churn compared to France and Spain.
  * Customer Activity → Inactive members have higher churn than active members.
  * Products → Customers with only one product churn more frequently than those with diversified product holdings.

### These trends were confirmed by both:

* SQL KPI Analysis (churn rates by age group, geography, tenure, etc.)
* ML Feature Importance (top predictors included balance, tenure, num_of_products, and age)

## Tools & Technologies

* Languages: Python, SQL
* Libraries: pandas, matplotlib, seaborn, scikit-learn
* Visualization: Tableau Public
* Platforms: Jupyter Notebook, VS Code, GitHub

## Lessons Learned

* F1 Score is more informative than accuracy for imbalanced data problems.
* Modular coding enables easier maintenance, reproducibility, and scalability.
* Data storytelling through Tableau improves communication of analytical results to non technical stakeholders.
* Feature store design bridges data engineering and data science, enabling smoother ML workflows.
