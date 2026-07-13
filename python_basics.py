
# ==========================================
# Question 1
# What is Python and why is it widely used in Data Analytics?
#
# Answer:
# Python is a high-level, easy-to-learn programming language.
# It is widely used in Data Analytics because:
# 1. It has a simple and readable syntax.
# 2. It provides powerful libraries like NumPy, Pandas, and Matplotlib.
# 3. It helps analyze, process, and visualize data efficiently.
# ==========================================


# ==========================================
# Question 2
# Explain the difference between List and Tuple in Python.
#
# Answer:
# List:
# - Lists are mutable (can be changed).
# - Lists use square brackets [].
# - Example: [1, 2, 3]
#
# Tuple:
# - Tuples are immutable (cannot be changed).
# - Tuples use parentheses ().
# - Example: (1, 2, 3)
# ==========================================


# ==========================================
# Question 3
# What is a function in Python? Why are functions useful?
#
# Answer:
# A function is a block of code that performs a specific task.
#
# Functions are useful because:
# 1. They reduce code repetition.
# 2. They make programs easier to read and understand.
# 3. They improve code reusability and make debugging easier.
# ==========================================


# Question 4

def question4():
    name = input("Enter your name: ")
    print("Hello,", name, "! Welcome.")

# Question 5

def question5():
    num = int(input("Enter a number: "))

    if num % 2 == 0:
        print("The number is Even.")
    else:
        print("The number is Odd.")

# Question 6

def question6():
    for i in range(1, 11):
        print(i)

# Question 7

def question7():
    numbers = [12, 45, 8, 67, 25]
    print("Maximum number is:", max(numbers))

# Question 8

def question8():
    numbers = [1, 2, 2, 3, 4, 4, 5]
    unique_numbers = list(set(numbers))
    print("List after removing duplicates:", unique_numbers)

# Question 9

def square(number):
    return number * number

def question9():
    num = int(input("Enter a number: "))
    print("Square of", num, "is", square(num))

# Question 10

def question10():
    numbers = [2, 3, 4, 2, 5, 2]
    num = int(input("Enter the number to count: "))
    count = numbers.count(num)
    print("The number appears", count, "times.")


    print("\nSelect Question to Run")
print("4. Question 4")
print("5. Question 5")
print("6. Question 6")
print("7. Question 7")
print("8. Question 8")
print("9. Question 9")
print("10. Question 10")

choice = input("Enter question number: ")

if choice == "4":
    question4()
elif choice == "5":
    question5()
elif choice == "6":
    question6()
elif choice == "7":
    question7()
elif choice == "8":
    question8()
elif choice == "9":
    question9()
elif choice == "10":
    question10()
else:
    print("Invalid choice")
