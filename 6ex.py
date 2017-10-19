#Defines variables
x = "There are %d types of people" % 10
binary = "binary"
do_not = "don't"
#Uses formatted variables within a string, and everything gets stored in a variable.
y = "Those who know %s and those who %s" % (binary, do_not)

print x
print y

#prints out a string and a formatted variable
print "I said: %r." % x
print "I also said '%s'" % y

#Creates a boolean value
hilarious = False
#creates a variable with a string in it and a formatted variable
joke_evaluation = "Isn't that joke so funny?! %r"

#prints two varaibles
print joke_evaluation % hilarious

w = "This is the left side of..."

e = "a string with a right side."

#concatenates two varibles
print w + e
