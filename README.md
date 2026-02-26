# 🏦 Bank Customer Churn Prediction

## 📌 Project Overview

This project focuses on analyzing bank customer data and building a Machine Learning model to predict customer churn. Customer churn refers to customers who stop using a bank’s services. Predicting churn is critical for financial institutions because retaining existing customers is generally more cost-effective than acquiring new ones.

The project covers the full data analysis workflow: data preprocessing, exploratory data analysis (EDA), feature engineering, model training, evaluation, and business insights generation.

---

## 🎯 Objectives

* Analyze customer behavior and identify key factors influencing churn
* Build classification models to predict the probability of customer churn
* Evaluate model performance using appropriate metrics
* Generate business insights to support customer retention strategies

---

## 📊 Dataset Description

The dataset contains customer-level information such as:

* Customer demographics (e.g., Age, Gender, Geography)
* Account information (e.g., Balance, Tenure, Number of Products)
* Activity status and credit score
* Target variable: `Churn` (1 = Customer left, 0 = Customer stayed)

---

## 🔎 Project Workflow

### 1️⃣ Data Preprocessing

* Handling missing values
* Encoding categorical variables
* Feature scaling (if required)
* Train-test split

### 2️⃣ Exploratory Data Analysis (EDA)

* Overall churn rate analysis
* Churn distribution by age, geography, gender, and tenure
* Correlation analysis between features
* Visualization using charts and plots

### 3️⃣ Model Building

Models implemented may include:

* Random Forest
* XGBoost
* LightGBM (if applied)

Pipeline structure is used to combine preprocessing and model training.

### 4️⃣ Model Evaluation

Performance metrics used:

* Accuracy
* Precision & Recall
* ROC-AUC Score

Confusion matrix and ROC curve are used for deeper performance analysis.

---

## 🛠 Technologies Used

* Python
* pandas & numpy
* scikit-learn
* plotly
* LightGBM / XGBoost (if applicable)
* Jupyter Notebook

---

## 📂 Repository Structure

```
Bank-Churn/
│
├── Bank.ipynb                # Main notebook (EDA + modeling)
├── model_training.ipynb      # Model training workflow
├── bank_customers_churn.json # Dataset file
├── Churn.sql                 # SQL queries
├── requirements.txt          # Required libraries
└── README.md                 # Project documentation
```

---

## 🚀 How to Run the Project

1. Clone the repository:

```bash
git clone https://github.com/Toancodewell/Bank-Churn.git
cd Bank-Churn
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Run Jupyter Notebook:

```bash
jupyter notebook
```

4. Open and execute:

* `Bank.ipynb` for EDA and modeling
* `model_training.ipynb` for detailed training process

5. To launch the interactive dashboard using Panel:

```bash
panel serve Bank.ipynb --show
```

After running the command, the dashboard will automatically open in your browser (default: [http://localhost:5006/bank](http://localhost:5006/Bank)).

---

## 📈 Business Insights

The model helps identify high-risk customers based on behavioral and financial patterns. Key insights can support:

* Targeted retention campaigns
* Personalized financial offers
* Risk-based customer segmentation

---

