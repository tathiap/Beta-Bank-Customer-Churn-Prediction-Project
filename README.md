# Beta Bank Customer Churn Prediction (Two-Track Project)

This project explores customer churn at Beta Bank through two different lenses: one designed for transparent, exploratory storytelling (ideal for portfolio walkthroughs), and another built as a modular, production-style machine learning pipeline using .py scripts. Both versions aim to predict which customers are at risk of leaving the bank.



## Project Versions

### 1. Exploratory Jupyter Notebook Version

* Audience: For portfolio review, recruiters, and educational purposes
* Style: Step-by-step walkthrough, visual-rich, with markdown explanations
* Focus: Emphasis on EDA, learning process, and interpretability
* File: churn_prediction_exploratory.ipynb

### 2. Modular Python Script Version

* Audience: For technical demonstration of real-world ML deployment structure
* Style: Clean Python modules (main.py, model.py, evaluate.py, etc.)
* Focus: Reusability, scalability, and production-readiness
* Entry Point: main.py


## Objective

To develop a machine learning classifier capable of predicting customer churn using structured historical banking data. The business goal is to support proactive retention strategies by identifying customers at high risk of exiting the bank.

## ML Workflow Summary (Both Versions)

* Data Cleaning and null handling
* Exploratory Data Analysis (EDA) of categorical and numerical churn patterns
* Feature Engineering using one-hot encoding and column transformers
* Class Imbalance Handling via random upsampling
* Modeling with Random Forest Classifier
* Hyperparameter Tuning using GridSearchCV (in .py version)
* Evaluation via F1 Score, Confusion Matrix, ROC Curve, and Feature Importance

## Key Takeaways

* Customers in certain geographies and those with lower product engagement are more likely to churn.
* Balancing the training set significantly improved recall and F1 score for minority class predictions.
* Final model F1 Score: ~0.59 (meets the 0.59 benchmark goal).


## Tools & Technologies

* Python (Jupyter, PyCharm, or VSCode)
* Libraries: pandas, seaborn, matplotlib, scikit-learn
* ML Technique: Random Forest (with optional GridSearch tuning)

## Lessons Learned

* F1 Score is a more appropriate metric than accuracy for imbalanced classification tasks.
* Combining EDA with domain context allows for better feature interpretation.
* Rewriting notebooks into .py modules improves reusability and production readiness.

