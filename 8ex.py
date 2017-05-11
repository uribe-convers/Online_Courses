#Creates a variable with a string of text
formatter = "%r %r %r %r"

#prints the string variable which expands into four formatted variables
#of any character, `%r`. Then it passes the values for the expanded variable,
#which in this case are integers
print formatter % (1, 2, 3, 4)

#same as above but this time the information passed to the formatted variable
#are characters and that's why they are in quotations. This works with the
#same code because the formatted variable is `%r` and so it works for any character
print formatter % ("one", "two", "three", "four")

#same as above but this time the information passed to the formatted variable
#are boolean values. Again, the %r works for anything.
print formatter % (True, False, False, True)

#same as above but this time the information passed to the formatted variable
#are variables
print formatter % (formatter, formatter, formatter, formatter)

print formatter % (
    "I had this string.",
    "That you could type up right.",
    "But it didn't sing.",
    "So I said goodnight."
)
