name = 'Zed A. Shaw'

age = 35 # not a lie

height = 74 # inches

weight = 180 # pounds

eyes = 'blue'

teeth = 'white'

hair = 'brown'

print "Let's talk about %s." % name
print "He is %d inches tall." % height
print "He is %d pounds heavy." % weight
print "Actually that's not too heavy."
print "He has got %s eyes and %s hair." % (eyes, hair)
print "His teeths are usually %s depending on the coffee" % teeth

#This line is tricky, try to get it exactly right
print "If I add %d, %d, and %d I get %d" % (age, height, weight, age + height + weight)

weight_kg = weight / 2.20462
height_cm = height / 0.393701

print "%s is %d kilograms heavy and %d centimeters tall" % (name, weight_kg, height_cm)


#All the possible Python format characteres are:
# Format Symbol	Conversion
# %c    character
# %s    string conversion via str() prior to formatting
# %i    signed decimal integer
# %d    signed decimal integer
# %r    any character: print no matter what
