import pandas as pd
import numpy as np

from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import OneHotEncoder

from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline


def question1():
    df = pd.read_csv("employee_productivity_dataset.csv")

    df["Age"] = df["Age"].fillna(df["Age"].median())
    df["Salary"] = df["Salary"].fillna(df["Salary"].mean())
    df["Hours_Worked_Per_Week"] = df["Hours_Worked_Per_Week"].fillna(df["Hours_Worked_Per_Week"].median())
    df["Performance_Score"] = df["Performance_Score"].fillna(df["Performance_Score"].mean())

    print(df)


def question2():
    df = pd.read_csv("employee_productivity_dataset.csv")

    le = LabelEncoder()

    df["Gender"] = le.fit_transform(df["Gender"])
    df["Department"] = le.fit_transform(df["Department"])

    print(df[["Gender", "Department"]].head())


def question3():
    df = pd.read_csv("employee_productivity_dataset.csv")

    df = pd.get_dummies(df, columns=["Work_Mode", "Location"])

    print(df.head())
    print("\nTotal Columns:", len(df.columns))


def question4():
    df = pd.read_csv("employee_productivity_dataset.csv")

    scaler = MinMaxScaler()

    df[["Salary", "Hours_Worked_Per_Week"]] = scaler.fit_transform(
        df[["Salary", "Hours_Worked_Per_Week"]]
    )

    print(df[["Salary", "Hours_Worked_Per_Week"]].head())


def question5():
    df = pd.read_csv("employee_productivity_dataset.csv")

    scaler = StandardScaler()

    df[["Age", "Projects_Completed"]] = scaler.fit_transform(
        df[["Age", "Projects_Completed"]]
    )

    print(df[["Age", "Projects_Completed"]].head())


def question6():
    df = pd.read_csv("employee_productivity_dataset.csv")

    minmax = MinMaxScaler()
    standard = StandardScaler()

    df["Salary_MinMax"] = minmax.fit_transform(df[["Salary"]])
    df["Salary_Standard"] = standard.fit_transform(df[["Salary"]])

    print(df[["Salary", "Salary_MinMax", "Salary_Standard"]].head())


def question7():
    df = pd.read_csv("employee_productivity_dataset.csv")

    categorical = ["Gender", "Department", "Work_Mode", "Location"]
    numerical = [
        "Age",
        "Salary",
        "Hours_Worked_Per_Week",
        "Projects_Completed",
        "Performance_Score",
    ]

    preprocessor = ColumnTransformer(
        transformers=[
            ("cat", OneHotEncoder(handle_unknown="ignore"), categorical),
            ("num", StandardScaler(), numerical),
        ]
    )

    pipeline = Pipeline(
        steps=[
            ("preprocessor", preprocessor)
        ]
    )

    print(pipeline)


def question8():
    df = pd.read_csv("employee_productivity_dataset.csv")

    categorical = ["Gender", "Department", "Work_Mode", "Location"]
    numerical = [
        "Age",
        "Salary",
        "Hours_Worked_Per_Week",
        "Projects_Completed",
        "Performance_Score",
    ]

    preprocessor = ColumnTransformer(
        transformers=[
            ("cat", OneHotEncoder(handle_unknown="ignore"), categorical),
            ("num", StandardScaler(), numerical),
        ]
    )

    pipeline = Pipeline(
        steps=[
            ("preprocessor", preprocessor)
        ]
    )

    transformed = pipeline.fit_transform(df)

    print("Shape of Final Dataset:")
    print(transformed.shape)


def question9():
    print("Scaling is important because it brings numerical features to a similar range, improves model performance, speeds up training, and prevents features with large values from dominating the model.")


def question10():
    print("Machine learning algorithms work with numbers. Therefore, categorical data must be converted into numerical form using techniques like Label Encoding or One-Hot Encoding.")


print("\n1. Question 1")
print("2. Question 2")
print("3. Question 3")
print("4. Question 4")
print("5. Question 5")
print("6. Question 6")
print("7. Question 7")
print("8. Question 8")
print("9. Question 9")
print("10. Question 10")

choice = int(input("\nEnter Question Number: "))

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
    print("Invalid Choice")
