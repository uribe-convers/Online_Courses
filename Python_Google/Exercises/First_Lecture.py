#!/usr/bin/python -tt
# Google Python Lecture One

import sys

# To see what a module is and what is in it
# dir(sys)

# or

# help(sys)

# or if you know a ceratin function exists
# help(sys.exit)

# Strings can be in single or double quotes
a = "Hello"
b = "Simon"
print(a.lower())
print(a.upper())
print(a.find("e"))

# To look inside of a string use squeare brakets, with [0] being the left most position

print(a[0])

print(a[1])

# You can put strings together with a plus symbol

print(a+b)
# If you include a comma, then the variables are shown apart.

print(a, b)

# You can also have ranges. [index1 : index2]
# Important, the second index means go up to that number but don't include it!
# This is called slices

print(len(a))

print(a[1:3])

# If you omit the first index it starts at the beginnig and if you omit the second one, it goes to the end of the string

print(a[:4])
print(a[2:])

# a[:] gioves you the whole string

print(a[:])

# You can also index with negative numbers (-1, -2...) and it works the same but starts from right to left
# It's like doing len -1 This is useful if you need the last elements of a string!

#leave the last character out
print(a[-1])
#leave the last three characters out
print(a[:-3])

#Only prints the last three characters
print(a[-3:])
