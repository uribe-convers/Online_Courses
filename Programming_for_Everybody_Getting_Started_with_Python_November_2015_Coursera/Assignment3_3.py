inp =raw_input("Enter Score: ")
v=float(inp)
if v < 0.0:
	print "Please enter a score between 0.0 and 1.0"
elif v > 1.0:
	print "Please enter a score between 0.0 and 1.0"
elif v >= 0.9:
	print "A"
elif v>= 0.8:
	print "B"
elif v>= 0.7:
	print "C"
elif v>= 0.6:
	print "D"
else:
	v < 0.6
	print "F"
