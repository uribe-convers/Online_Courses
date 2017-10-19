# Escaping characteres
# Escapes double quote, string is defined by double quotes so siblge quotes don't matter
print "I am 6'2\" tall"
# Escapes single quote, string is defined by single quotes so double quotes don't matter
print 'I am 6\'2" tall'

tabby_cat = "\tI'm tabbed in"
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat."

fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

print tabby_cat
print persian_cat
print backslash_cat
print fat_cat

#
while True:
    for i in ["/","-","|","\\","|"]:
        print "%s\r" % i,
