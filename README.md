# Beta Bank Customer Churn

This project explores customer churn at Beta Bank using classical machine learning techniques. The goal is to predict which customers are likely to leave, empowering the bank to take proactive retention measures.

## Project Overview

* Objective: Predict customer churn using structured historical banking data.

* Goal Metric: Optimize for the F1 Score, balancing precision and recall.

* Approach: Exploratory data analysis + upsampling + Random Forest Classifier.

## Key Insights

* Customers in certain regions have higher churn rates.

* Factors such as age, balance, and number of products show strong correlation with churn.

* Upsampling was used to address class imbalance.

## Technologies Used

* Python (Jupyter Notebook)

* Libraries: pandas, matplotlib, seaborn, scikit-learn

* Model: RandomForestClassifier

## Workflow

1. Data Cleaning and Preprocessing

2. Exploratory Data Analysis (EDA)

3. Handling class imbalance with upsampling

4. Training a Random Forest model

5. Evaluation using classification report & feature importance

## Model Performance

Metrics & Scores 

F1 Score :~0.65+ (varies slightly)

Accuracy: ~0.85+

** Note: Scores vary depending on upsampling randomness and preprocessing.

## Notable Visuals

* Churn distribution and regional differences

* Boxplots of numerical features by churn class

* Feature importance ranking (top 10 most influential)

## File Structure

* Churn_prediction_exploratory.ipynb    # Step-by-step version
* Churn_prediction_modular.ipynb        # Function-based refactored version
* Churn.csv                             # Input dataset
* README.md

## Lessons Learned

* Importance of data preprocessing and balancing techniques

* How EDA can inform modeling decisions

* Working with pipelines and transformers in scikit-learn

## Deep Dive: Problem Framing, Features, and Modeling Decisions

### Why Churn Prediction Matters:
Customer churn has a significant impact on the financial performance of banks. Acquiring new customers is often 5x more expensive than retaining existing ones. Predictive models that identify customers at risk allow the bank to offer targeted incentives, personalized outreach, or product changes before customers exit.

### Key Features That Influence Churn

* Age: Older customers showed higher churn risk, possibly reflecting retirement or lifestyle changes.

* Balance: Customers with higher balances tend to churn less possibly due to deeper product engagement or preferential services.

* Number of Products: A strong negative correlation with churn. Customers with more products (e.g., loans + credit cards) are more likely to stay.

* Geography & Gender: Regional churn differences were visible, prompting further segmentation opportunities.

### Modeling Approach

Initial tests included Logistic Regression, but performance was limited due to its linear nature. A Random Forest model was chosen for its:

* Ability to capture nonlinear relationships

* Robustness against overfitting with tuned parameters

* Built-in feature importance scoring

## Handling Class Imbalance

Only ~20% of customers in the dataset churned, which required addressing class imbalance. Random upsampling was used on the training set to provide the classifier with balanced class exposure.

## Model Evaluation

The F1 Score was prioritized over accuracy to better reflect the cost of false negatives (i.e., missing customers about to leave). In a banking context, predicting churn incorrectly is more acceptable than failing to catch a real churner.






