largest = None
smallest = None
while True:
    try:
       num = raw_input("Enter a number: ")
       num_int = int(num)
       if largest is None:
            largest = num_int
       elif num_int > largest:
            largest = num_int
       
       if smallest is None:
            smallest = num_int
       elif num_int < smallest:
            smallest = num_int
       
    except:
       if num == "done":
            break
       else:
            print "Invalid input"
    
print "Maximum is", largest
print "Minimum is", smallest