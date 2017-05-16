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

s = ('''Hola
como
estas''')
s

# The code above stores the string in variable s and it returns it with the
# new lines `\n` symbol instead that actual new lines.
