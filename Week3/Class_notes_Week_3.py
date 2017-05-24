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


# If Statements

# You can create preconditions, which allow only values to be in a certain range

# If a function ends without a `return` statement being execute, that function
# returns `None`. Value `None` hase type `NoneType`

# Structure of an `if` statement:
#   if expression:
#       statements
#   elif expression:    #else if some other condition
#       statements
#   else:    #if none of the preceding conditions are true, do this...
#       statements

# You can have 0 or more `elif` clauses associated with the `if`
# There can be 0 or 1 `else` clauses and the `else` must be the last clause of
# the `if` statement.

# The clauses are evaluated in order and the body of the first clause that evaluates
# to `True` is executed and the `if` statement is terminated without checking any more conditions.

def report_status(scheduled_time, estimated_time):
    '''(number, number) -> str

    Return flight status (ON Time, Early, Delayed) for a flight that was
    scheduled to arrive at scheduled_time, but now is estimated to arrive
    at estimated_time.

    Pre-conditions:
    0.0 <= scheduled_time < 24 and
    0.0 <= estimated_time < 24

    >>>report_status(14.3, 14.3)
    'On Time'
    >>>report_status(12.5, 11.5)
    'Early'
    >>>report_status(9.0, 9.5)
    'Delayed'
    '''
    if scheduled_time == estimated_time:
        return 'On Time'
    elif scheduled_time > estimated_time:
        return 'Early'
    else:
        return 'Delayed'
