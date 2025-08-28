# Beta Bank Customer Churn Prediction (Two-Track Project)

This project analyzes customer churn at Beta Bank using two parallel tracks:

* A visual, exploratory notebook for storytelling and insights.
* A modular, production ready Python pipeline for real world deployment.
* An interactive Tableau dashboard for executive level reporting.


## Ojective 

To build a machine learning model that predicts customer churn using historical banking data, enabling the bank to proactively identify at risk customers and improve retention strategies.

## Project Versions

| Version      | Description                                            |
| ------------ | ------------------------------------------------------ |
| `notebooks/` | Visual, step-by-step walkthrough in Jupyter Notebook   |
| `scripts/`   | Modular Python scripts built for scalability and reuse |
| `sql/`       | SQL queries for data extraction and churn analysis     |
| `tableau/`   | Tableau dashboard for visualizing churn trends         |
| `data/`      | Source datasets used in analysis                       |



## ML Pipeline Overview

Both versions of the project follow this pipeline:

1. Data Cleaning – Handling nulls and formatting issues
2. EDA (Exploratory Data Analysis) – Analyzing churn by geography, gender, credit score, etc.
3. Feature Engineering – Including one hot encoding and numeric transformations
4. Class Imbalance Handling – Upsampling minority class for balanced modeling
5. Modeling – Random Forest Classifier (with GridSearchCV tuning in script version)
6. Evaluation – F1 Score, Confusion Matrix, ROC Curve, Feature Importance


## Tableau Dashboard

The Tableau dashboard highlights:

* Churn Distribution
* Churn by Gender
* Churn by Geography (Percentage-based)

🔗 View Dashboard: (https://public.tableau.com/app/profile/tathia.primasany/viz/BetaBankCustomerChurnPredicition/Dashboard1?publish=yes)

## Key Insights

* Customers in Germany exhibit the highest churn rate, followed by France and Spain.
* Lower product engagement, fewer active accounts, and lower credit scores are associated with churn.
* After balancing the training set, the Random Forest model achieved an F1 Score of ~0.59, meeting the benchmark.

## Tools & Technologies

* Languages: Python, SQL
* Libraries: pandas, matplotlib, seaborn, scikit-learn
* Visualization: Tableau Public
* Platforms: Jupyter Notebook, VS Code, GitHub

## Lessons Learned

* F1 Score is more informative than accuracy for imbalanced data problems.
* Modular coding enables easier maintenance, reproducibility, and scalability.
* Data storytelling through Tableau improves communication of analytical results to non technical stakeholders.
