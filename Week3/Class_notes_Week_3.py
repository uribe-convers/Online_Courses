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
