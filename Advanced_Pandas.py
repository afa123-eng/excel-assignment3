import pandas as pd
import numpy as np


def question1():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    print("First 10 Rows:")
    print(df.head(10))

    print("\nDataset Information:")
    df.info()

    print("\nRows and Columns:")
    print(df.shape)

    print("\nData Types:")
    print(df.dtypes)


def question2():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    print("Sales > 3500")
    print(df[df["Sales"] > 3500])

    print("\nRegion = East and Sales > 2500")
    print(df[(df["Region"] == "East") & (df["Sales"] > 2500)])


def question3():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    top5 = df.groupby("Customer")["Sales"].sum().sort_values(ascending=False).head(5)

    print(top5)


def question4():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    region_sales = df.groupby("Region")["Sales"].sum()

    print(region_sales)

    print("\nHighest Revenue Region:")
    print(region_sales.idxmax())

    print("\nHighest Sales:")
    print(region_sales.max())


def question5():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    product_quantity = df.groupby("Product")["Quantity"].sum()

    print(product_quantity)

    print("\nMost Popular Product:")
    print(product_quantity.idxmax())


def question6():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    result = df.groupby(["Region", "Category"])["Sales"].sum()

    print(result)


def question7():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    pivot = pd.pivot_table(
        df,
        values="Sales",
        index="Region",
        columns="Product",
        aggfunc="sum"
    )

    print(pivot)

    if "Laptop" in pivot.columns:
        print("\nRegion selling most Laptops:")
        print(pivot["Laptop"].idxmax())


def question8():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    profit = df.groupby("Category")["Profit"].mean()

    print(profit)

    print("\nMost Profitable Category:")
    print(profit.idxmax())


def question9():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    discount_profit = df.groupby("Discount")["Profit"].mean()

    print(discount_profit)


def question10():
    df = pd.read_csv("Advanced_pandas_sales_dataset.csv")

    filtered = df[df["Sales"] > 3000]

    grouped = filtered.groupby(["Region", "Product"])["Sales"].sum()

    print(grouped)

    pivot = grouped.unstack()

    print("\nPivot Table:")
    print(pivot)


    print("1. Question 1")
print("2. Question 2")
print("3. Question 3")
print("4. Question 4")
print("5. Question 5")
print("6. Question 6")
print("7. Question 7")
print("8. Question 8")
print("9. Question 9")
print("10. Question 10")

choice = int(input("Enter question number: "))

if choice == 1:
    question1()
elif choice == 2:
    question2()
elif choice == 3:
    question3()
elif choice == 4:
    question4()
elif choice == 5:
    question5()
elif choice == 6:
    question6()
elif choice == 7:
    question7()
elif choice == 8:
    question8()
elif choice == 9:
    question9()
elif choice == 10:
    question10()
else:
    print("Invalid choice")
