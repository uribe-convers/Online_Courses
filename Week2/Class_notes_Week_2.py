# Types of Strings

# Strings can be in single or double-quotes
# You can escape characters with backslash
greeting = 'What\'s up?'
friend = "Santiago"
print greeting

# Strings can be concatenated with the plus sign, you have to add punctuation.

print greeting + " " + friend

# You can also multiply strings, but not divide, substract, elevate to power

print greeting * 5

# String formatting and input/output

# If you concatenate strings and separate them with a comma, python will add
# a space between them

print greeting, friend
print "There is", "a potato"

# There is a big difference when using `return` or `print` in a function.
# `return` can either return or assigns the value to a variable, whereas
# `print` only prints it. `print` also creates a value of `None` so if it's
# passed to a variable, that variable can't be used in mathematical operations.
# When a return statement is excecuted, it passes a value back to the caller
# and exits the function.

# For example, the code below won't work:

def add(number1, number2):
    print(number1 + number2)

result = add(1, 3)
new_result = result + 1
print new_result

# But this code will:

def add2(number1, number2):
    return number1 + number2

result2 = add2(1, 3)
new_result2 = result2 + 1
print new_result2

# If there is a return statement before a print, or somethig else, the function
# exits before reaching it:

def add(number1, number2):
    return number1 + number2
    print("hello")

result = add(1, 3)

# Getting a string from the user using the raw_input function (or input in Python3):

raw_input("What is your name? ")

# Or store it in a variable
name = raw_input("What is your name? ")

location = raw_input("Where do you live? ")

print name, "lives in", location

# Python3
# print (name, "lives in", location)

# All values returned by raw_input are strings

coffee = raw_input("How many cups of coffee today? ")
# The answer will be a string and **not** an int

# Triple quotes allow for strings to span multiple lines
print('''Hola
como
estas?''')

# The code below stores the string in variable s and it returns it with the
# new lines `\n` symbol instead that actual new lines.
s = ('''Hola
como
estas''')
s

# Adding documentation for your own functions in a Docstring

def area(base, height):
    '''(number, number) -> number
    Return the area of a triangle with dimensions base and height.'''
    return base * height / 2


# Design Recipe for functions
# Write a function that convertes from fahrenheit to celsius
# The Type Contract describes the type of parameters and return value.
# the desciption should mention the return value and the parameters by name
# The 6 parts of a function are:
# Header: def convert_to_celsius(fahrenheit):
# Type Contract: (number) -> number
# Description
# Examples
# Body
# Test your own examples and get the result you expect

def convert_to_celsius(fahrenheit):
    '''(number) -> float
    This will convert fahrenheit degrees and return the equivalent number of celsius degrees
    >>> convert_to_celsius(32)
    0
    >>> convert_to_celsius(212)
    100'''
    return (fahrenheit - 32) * 5 / 9.0
