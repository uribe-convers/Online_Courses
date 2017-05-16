# Built-in functions

# What's the largest number?
max(arguments)

max(68.6, 545, 454.5)

# How to know which built-in functions exist?

dir(__builtins__)

# For help on functions
help(abs)

abs(-456.8)

# Defining your own functions
# def functionname(parameteres):
    #body

# for a function to elevate a number to the power of 2
def f(x):
    return x ** 2

result = f(3)

# Calling the function
f(5)
