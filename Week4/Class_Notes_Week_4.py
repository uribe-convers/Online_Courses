# For Loops and Fancy String Manipulation
# Strings can be compared using operators.

animal = "cat"
animal == "cat"
animal != "cat"

# They can be compared using Operators and their order in the alphabet letter by letter
# >, <, >=, <=, all work
"abracadabra" < "ace"
"abracadabra" > "ace"

# Capitalization mattres! Capital lettres are less than lower case letters

"a" <= "A"

 # You can always compare diffreent types for equality or inequality

"s" != 3

 # But you can't order different types

"s" < 3

# You can see if a str is within another str

"cad" in "abracadabra"

"c" in "aeiou"

# Order matters

"zoo" in "ooze"

# Empty str in another word or in itself

"" in "abc"

"" in ""

# The function `len()` tells you how long a str is
# It counts every character including spaces and puctucation!

len("")

len("abracadabra")

len("bwa" + "ha" * 10) #remember that order in math matters!
len("bwa" "ha" * 10)

print("bwa" "ha")
