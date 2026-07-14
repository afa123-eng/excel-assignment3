import pandas as pd
import numpy as np

# ==========================================
# Question 1
# Load the dataset and display the first 5 rows
# along with dataset information.
# ==========================================

def question1():
    df = pd.read_csv("retail_dataset.csv")

    print("First 5 Rows:")
    print(df.head())

    print("\nDataset Information:")
    df.info()

    # ==========================================
# Question 2
# ==========================================

def question2():
    df = pd.read_csv("retail_dataset.csv")

    print("Missing values in each column:")
    print(df.isnull().sum())

    print("\nTotal Missing Values:")
    print(df.isnull().sum().sum())

    # ==========================================
# Question 3
# ==========================================

def question3():
    df = pd.read_csv("retail_dataset.csv")

    df["Quantity"] = df["Quantity"].fillna(df["Quantity"].mean())
    df["Price"] = df["Price"].fillna(df["Price"].mean())

    print(df)

    # ==========================================
# Question 4
# ==========================================

def question4():
    df = pd.read_csv("retail_dataset.csv")

    df = df.dropna(subset=["Product Category", "Region"])

    print(df)

    # ==========================================
# Question 5
# ==========================================

def question5():
    df = pd.read_csv("retail_dataset.csv")

    df["Quantity"] = df["Quantity"].fillna(df["Quantity"].mean())
    df["Price"] = df["Price"].fillna(df["Price"].mean())

    df["Revenue"] = np.multiply(df["Quantity"], df["Price"])

    print(df)

    # ==========================================
# Question 6
# ==========================================

def question6():
    df = pd.read_csv("retail_dataset.csv")

    df["Quantity"] = df["Quantity"].fillna(df["Quantity"].mean())
    df["Price"] = df["Price"].fillna(df["Price"].mean())

    df["Revenue"] = np.multiply(df["Quantity"], df["Price"])

    total_revenue = np.sum(df["Revenue"])

    print("Total Revenue:", total_revenue)


    # ==========================================
# Question 7
# ==========================================

def question7():
    df = pd.read_csv("retail_dataset.csv")

    df["Quantity"] = df["Quantity"].fillna(df["Quantity"].mean())
    df["Price"] = df["Price"].fillna(df["Price"].mean())

    df["Revenue"] = np.multiply(df["Quantity"], df["Price"])

    revenue = df.groupby("Product Category")["Revenue"].sum()

    print(revenue)



    # ==========================================
# Question 8
# ==========================================

def question8():
    df = pd.read_csv("retail_dataset.csv")

    df["Quantity"] = df["Quantity"].fillna(df["Quantity"].mean())
    df["Price"] = df["Price"].fillna(df["Price"].mean())

    df["Revenue"] = np.multiply(df["Quantity"], df["Price"])

    revenue = df.groupby("Product Category")["Revenue"].sum()

    print("Top 3 Categories:")
    print(revenue.nlargest(3))

    print("\nBottom 3 Categories:")
    print(revenue.nsmallest(3))



    # ==========================================
# Question 9
# ==========================================

def question9():
    df = pd.read_csv("retail_dataset.csv")

    df["Quantity"] = df["Quantity"].fillna(df["Quantity"].mean())
    df["Price"] = df["Price"].fillna(df["Price"].mean())

    df["Revenue"] = np.multiply(df["Quantity"], df["Price"])

    revenue = df.groupby("Region")["Revenue"].sum()

    print(revenue)

    print("\nHighest Revenue Region:")
    print(revenue.idxmax())

    print("\nLowest Revenue Region:")
    print(revenue.idxmin())


    # ==========================================
# Question 10
# ==========================================

def question10():
    df = pd.read_csv("retail_dataset.csv")

    df["Quantity"] = df["Quantity"].fillna(df["Quantity"].mean())
    df["Price"] = df["Price"].fillna(df["Price"].mean())

    df["Revenue"] = np.multiply(df["Quantity"], df["Price"])

    df["Date"] = pd.to_datetime(df["Date"], dayfirst=True)

    df["Month"] = df["Date"].dt.month_name()

    monthly_revenue = df.groupby("Month")["Revenue"].sum()

    print("Monthly Revenue:")
    print(monthly_revenue)

    print("\nMean Revenue:", np.mean(df["Revenue"]))
    print("Median Revenue:", np.median(df["Revenue"]))
    print("Standard Deviation:", np.std(df["Revenue"]))

    
