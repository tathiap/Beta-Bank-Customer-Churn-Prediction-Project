# churn_prediction/main.py

from preprocess import load_and_clean_data, preprocess_features
from eda import run_eda
from model import train_model
from evaluate import (
    evaluate_model,
    plot_confusion_matrix,
    plot_roc_auc,
    plot_feature_importance
)

def main():
    # Load and clean data
    df = load_and_clean_data("data/Churn.csv")

    # Perform Exploratory Data Analysis
    run_eda(df)

    # Preprocess features and split target
    X, y, preprocessor = preprocess_features(df)

    # Train model with upsampling
    model, X_test, y_test = train_model(X, y, preprocessor, balance="upsample")

    # Evaluate model performance
    evaluate_model(model, X_test, y_test)

    # Visual diagnostics
    plot_confusion_matrix(model, X_test, y_test, title="Best Model - Confusion Matrix")
    plot_roc_auc(model, X_test, y_test)
    plot_feature_importance(model, X_test)

if __name__ == "__main__":
    main()

