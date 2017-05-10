#Assign variables
cars = 100
space_in_a_car = 4.0
drivers = 30
passengers = 90
#Does calculations based on the variables above
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven

#Prints strings of text and either the value of a variable or the result of a calculation.
#Notice that the variables are separated but commas from the strings

print "There are", cars, "cars available."
print "There are only", drivers, "drivers available."
print "There will be", cars_not_driven, "empty cars today."
print "We can transport", carpool_capacity, "people today."
print "We have", passengers, "people to carpool today."
print "We need to put about", average_passengers_per_car, "in each car."

#Study drill
#Traceback (most recent call last):
#  File "ex4.py", line 8, in <module>
#    average_passengers_per_car = car_pool_capacity / passenger
#NameError: name 'car_pool_capacity' is not defined

#The error comes from not defining the variable "car_pool_capacity" or "passenger". These variables ar defined without the underscore and in plural,
#"carpool_capacity", and "passengers", respectively.
