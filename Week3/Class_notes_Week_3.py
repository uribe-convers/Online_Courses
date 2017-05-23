#Week 3

# Boolean values or TRUE and FALSE values

# They are useful for comparison
3 < 4

# and the answer is type bool

# Symbols for boolean comparisons are: <, >, >=, <=, == (equal), and != (not equal)

7 == 7.0
7 != 8

# Also works with variables

x = 7
y = 10

y >= x

# Logical Operators
# Logical operators can be applied to Boolean values
# There are three logical operators: not, and, or

# not
grade = 80

grade >= 50

not (grade >= 50) #Evaluate the expression first and that's True, then the `not`
not not (grade >= 50) # double negative `not not` becomes positive
# not not x is the same as x

# and

grade2 = 70

# Both expression are True so the answer is True
# It checks them in order
(grade >= 50) and (grade2 >= 50)

grade = 40
# The first operand is False so it doesn't even check the second operand
(grade >= 50) and (grade2 >= 50)

# and only evaluates to True if every operand is True, any other combination evaluates to False

# or

# The expression evaluates to True if at least one operand evaluates to True

grade = 80
grade2 = 70

(grade >= 50) or (grade2 >= 50)

grade2 = 40
(grade >= 50) or (grade2 >= 50) #The first operand is True so it doesn't even evaluate the second one

# The operators have precedende in how they are evaluated
# not > and > or
grade = 80
grade2 = 70
not grade >= 50 or grade2 >= 50
not (grade >= 50 or grade2 >= 50)

# It is recommened to use parenthesis when using multiple logical operators
# It also makes it easier to read



# Converting between different types (i.e., int, float, str, bool)

# Create a string
str(3)
three = str(3)
three * 77

# From a str to int
(three * 5)
# From str to int to str
str(int(three * 5))

str(5.67)

int('567')

float('5.67')

float('567')

int("I have 7 apples")
# This returns an error becuase this conversion is not possible
# same with the code below where a float type is appropriate
int('5.67')
# But this will work since it's from a float to an int:
int(5.67)


# Modules and built-in functions

# There are thousands of modules that have thousands of functions. To use them,
# you must import the appropriate module.

# Importing
import math

# Seeing what it has available
dir(math)

# Getting help
help(math.sqrt)

# To import your own modules, you only ned to call them without the `.py` extension.

import triangle

help(triangle.semiperimeter)

# IMPORTANT the module that's being imported must be in the same directory of the
# module that's importing it.
