# Week 1

# Built-in functions

What's the largest number?

```python
max(arguments)

max(68.6, 545, 454.5)
```

How to know which built-in functions exist?

```python
dir(__builtins__)
```

For help on functions

```python
help(abs)

abs(-456.8)
```

Defining your own functions

Use the following syntax:  

```python
def functionname(parameteres):  
    #body
```

for a function to elevate a number to the power of 2

```python
def f(x):
    return x ** 2

# Calling the function
f(5)
# Storing the result in a variable
result = f(3)
```

Functions can have multiple parameters

```python
def triangle_area(base, height):
    return base * height / 2
```
# Week 2

# Types of Strings

Strings can be in single or double-quotes  
You can escape characters with backslash  

```python
greeting = 'What\'s up?'
friend = "Santiago"
print (greeting)

```
Strings can be concatenated with the plus (`+`) sign, but you have to add punctuation.

```python
print (greeting + " " + friend)
```

You can also multiply strings, but not divide, nor subtract, nor elevate to power

```python
print (greeting * 5)
```

# String formatting and input/output

If you concatenate strings and separate them with a comma, python will add
a space between them

```python
print (greeting, friend)
print ("There is", "a potato")
```

There is a big difference when using `return` or `print` in a function.
`return` can either return or assign the value to a variable, whereas
`print` only prints it. `print` also creates a value of `None` so if it's
passed to a variable, that variable can't be used in mathematical operations.
When a return statement is executed, it passes a value back to the caller
and **exits the function.**

For example, the code below won't work:

```python
def add(number1, number2):
    print(number1 + number2)

result = add(1, 3)
print (result)
new_result = result + 1
print (new_result)
```

But this code will:

```python
def add2(number1, number2):
    return number1 + number2

result2 = add2(1, 3)
print (result2)
new_result3 = result2 + 1
print (new_result3)

```
If there is a return statement before a `print`, or something else, the function
exits before reaching it:

```python
def add(number1, number2):
    return number1 + number2
    print("hello")

result = add(1, 3)
print (result)
```

# Getting a string from the user using the `raw_input` function (or `input` in Python3):

```python
## Python 2
raw_input("What is your name? ")
## Python3
input ("What is your name? ")

Or store it in a variable

```python
name = raw_input("What is your name? ")

location = raw_input("Where do you live? ")

## Python2
print name, "lives in", location

## Python3
print (name, "lives in", location)

All values returned by `raw_input` are strings (`str`)

```python
coffee = raw_input("How many cups of coffee today? ")
```

The answer will be a *string and **not** an `int`!

Triple quotes allow for strings to span multiple lines

```python
print('''Hola
como
estas?''')
```

The code below stores the string in variable `s` and it returns it with the
new lines (`\n`) symbol instead of *actual* new lines.

```python
s = ('''Hola
como
estas''')
s
```

# Adding documentation for your own functions in a Docstring

```python
def area(base, height):
    '''(number, number) -> number
    Return the area of a triangle with dimensions base and height.'''
    return base * height / 2
```

## Design Recipe for functions
Write a function that converts from fahrenheit to celsius degrees

* The Type Contract describes the type of parameters and return value.  
* The description should mention the return value and the parameters by name  

### The 6 parts of writing a function are:

1. Header:  
`def convert_to_celsius(fahrenheit):`
2. Type Contract:  
`(number) -> number`
3. Description  
4. Examples  
5. Body  
6. Test your own examples and get the result you expect

### You should write a function in this order:

1. Examples  
2. Type Contract
3. Header
4. Description
5. Body
6. Test

```python
def convert_to_celsius(fahrenheit):
    '''(number) -> float
    Return the number of celsius degrees from the equivalent fahrenheit degrees
    >>> convert_to_celsius(32)
    0
    >>> convert_to_celsius(212)
    100'''
    return (fahrenheit - 32) * 5 / 9.0
```

# Reusing functions and calling a function from a function

If writing a function to return the smallest number of two temperatures, one
in Celsius one in Fahrenheit, reuse the function to convert to Celsius instead
of rewriting it.

```python
def min_temp(temp_Celsius, temp_fahreheit):
    '''(number, number) -> (float)
    Return the colder of two temperature in Celsius degrees. The user inputs one
    in Celsius (temp_Celsius) and one in Fahrenheit (temp_fahreheit).
    >>>min_temp(32, 40)
    4.444444444444445
    >>>min_temp(-23, -15)
    -26.11111111111111
    '''
    convert_temp_Celsius = convert_to_celsius(temp_fahreheit)
    return min(temp_Celsius, convert_temp_Celsius)
```

You can not only call functions from other function definition like I did
above, you can also call functions as parameters for other functions.
For example, using the built-in function max to find the largest
area of two triangles using the function triangle area from above:

```python
max(area(4.8, 5), area(56.3, 3))
```

# Quiz:

```python
def announce_location(country):
    print(country)
    return(country)

instructor_location = announce_location('Canada')
print(instructor_location)

x = None
print(x)
```

Two function definitions are saved in the same file:

A function 𝚌𝚘𝚞𝚗𝚝_𝚟𝚘𝚠𝚎𝚕𝚜 has one parameter, a word, and returns the number of vowels in that word.
A function 𝚌𝚘𝚞𝚗𝚝_𝚌𝚘𝚗𝚜𝚘𝚗𝚊𝚗𝚝𝚜 has one parameter, a word, and returns the number of consonants in that word.
To determine the number of letters in a word, write a one-line body for the following function that calls both 𝚌𝚘𝚞𝚗𝚝_𝚟𝚘𝚠𝚎𝚕𝚜 and 𝚌𝚘𝚞𝚗𝚝_𝚌𝚘𝚗𝚜𝚘𝚗𝚊𝚗𝚝𝚜:

```python
def count_letters(word):
    """ (str) -> int

    Return the number of letters in word.
    >>> count_letters('hello')
    5
    >>> count_letters('bonjour')
    7
    """
    return(𝚌𝚘𝚞𝚗𝚝_𝚟𝚘𝚠𝚎𝚕𝚜(word) + 𝚌𝚘𝚞𝚗𝚝_𝚌𝚘𝚗𝚜𝚘𝚗𝚊𝚗𝚝𝚜(word))
    Write the one-line function body that belongs here.
```    

Two function definitions are saved in the same file:

A function 𝚐𝚎𝚝_𝚌𝚊𝚙𝚒𝚝𝚊𝚕 has one string parameter that represents a country and returns its capital.
A function 𝚕𝚘𝚗𝚐𝚎𝚛 has two string parameters and returns the longer of the two strings.
Variables 𝚌𝚘𝚞𝚗𝚝𝚛𝚢𝟷 and 𝚌𝚘𝚞𝚗𝚝𝚛𝚢𝟸 refer to 𝚜𝚝𝚛 values. Write a one-line expression that produces the longer of the capitals of 𝚌𝚘𝚞𝚗𝚝𝚛𝚢𝟷 and 𝚌𝚘𝚞𝚗𝚝𝚛𝚢𝟸. Your expression should involve calls on both 𝚐𝚎𝚝_𝚌𝚊𝚙𝚒𝚝𝚊𝚕 and 𝚕𝚘𝚗𝚐𝚎𝚛.

```python
𝚐𝚎𝚝_𝚌𝚊𝚙𝚒𝚝𝚊𝚕(country1)
print(longer(𝚐𝚎𝚝_𝚌𝚊𝚙𝚒𝚝𝚊𝚕(country1), 𝚐𝚎𝚝_𝚌𝚊𝚙𝚒𝚝𝚊𝚕(country2)))
```

What is the value of 𝚊𝚟𝚎𝚛𝚊𝚐𝚎 after the following code is executed?

```python
grade1 = 80
grade2 = 90
average = (grade1 + grade2) / 2
grade1 = 100
```

# Week 3

# Boolean values or TRUE and FALSE values

They are useful for comparison

```python
3 < 4
```
and the answer is type `bool`

Symbols for boolean comparisons are: <, >, >=, <=, == (equal), and != (not equal)

```python
7 == 7.0
7 != 8
```

Also works with variables

```python
x = 7
y = 10

y >= x
```

# Logical Operators
Logical operators can be applied to Boolean values  
There are three logical operators:
```python
not, and, or
```

## The `not` operator

Evaluate the expression *first* and that results in `True`, then evaluates the `not`

```python
grade = 80

grade >= 50

not (grade >= 50)
not not (grade >= 50) #double negative `not not` becomes positive

# not not x is the same as x
```
## The `and` operator

Both expression **must** be `True` for the answer to be `True`  
It checks them in order.

```python
grade2 = 70
(grade >= 50) and (grade2 >= 50)

grade = 40

(grade >= 50) and (grade2 >= 50) #The first operand is False so it doesn't even check the second operand

```
**Operator `and` only evaluates to `True` if every operand is `True`, any other combination evaluates to `False`**

## The `or` operand

The expression evaluates to `True` if *at least one* operand evaluates to `True`

```python
grade = 80
grade2 = 70

(grade >= 50) or (grade2 >= 50)

grade2 = 40
(grade >= 50) or (grade2 >= 50) #The first operand is `True` so it doesn't even evaluate the second one
```

The operators have precedence in how they are evaluated:

**not > and > or**

```python
grade = 80
grade2 = 70
not grade >= 50 or grade2 >= 50
not (grade >= 50 or grade2 >= 50)
```
It is recommended to use parenthesis when using multiple logical operators.  
It also makes it easier to read


# Converting between different types (i.e., `int`, `float`, `str`, `bool`)

```python
# From an int to a string
str(3)
three = str(3)
three * 77

# From a str to int
int(three) * 3

# From str to int to str
str(int(three * 5))

str(5.67)

int('567')

float('5.67')

float('567')
```

There can be problems when converting types:

```python
int("I have 7 apples")
```
This returns an error because this conversion is not possible.  
Same with the code below where a `float` type is appropriate and not an `int`

```python
int('5.67')
```
But this will work since it's from a `float` to an `int`:

```python
int(5.67)
```


# Modules and built-in functions

There are thousands of modules that have thousands of functions. To use them,
you must import the appropriate module.

```python

# Importing
import math

# Seeing what the module has available
dir(math)

# Getting help
help(math.sqrt)
```

To import your own modules, you only need to call the file that contains them **without** the `.py` extension.

```python
import triangle

help(triangle.semiperimeter)
```

**IMPORTANT**  
The module that's being imported must be in the same directory of the
module that's importing it.


# If Statements

You can create preconditions, which allow only values to be in a certain range

If a function ends without a `return` statement being execute, that function
returns `None`. Value `None` has type `NoneType`

## Structure of an `if` statement:

```python
  if expression:
      statements
  elif expression:    #else if some other condition
      statements
  else:    #if none of the preceding conditions are true, do this...
      statements
```

You can have zero or more `elif` clauses associated with the `if`  
There can be zero or 1 `else` clauses and the `else` must be the *last* clause of
the `if` statement.

The clauses are evaluated in order and the body of the first clause that evaluates
to `True` is executed and the `if` statement is terminated without checking any more conditions.

```python
def report_status(scheduled_time, estimated_time):
    '''(number, number) -> str

    Return flight status (ON Time, Early, Delayed) for a flight that was
    scheduled to arrive at scheduled_time, but now is estimated to arrive
    at estimated_time.

    Pre-conditions:
    0.0 <= scheduled_time < 24 and
    0.0 <= estimated_time < 24

    >>>report_status(14.3, 14.3)
    'On Time'
    >>>report_status(12.5, 11.5)
    'Early'
    >>>report_status(9.0, 9.5)
    'Delayed'
    '''
    if scheduled_time == estimated_time:
        return 'On Time'
    elif scheduled_time > estimated_time:
        return 'Early'
    else:
        return 'Delayed'
```

## No `if` required

This is a style that uses `if` statements and boolean values together.

```python
def is_even(num):
    ''' (int) -> bool

    Returns whether num is even or not.

    >>> is_even(4)
    True
    >>> is_even(77)
    False
    '''
    if num % 2 == 0: #the remainder is 0 for an even number divided by 2
        return True
    else:
        return False
```

The function above works but it's three lines too long!

Because the expression `num % 2 == 0` is already returning a boolean value,
we can skip the `if` statement and use the boolean result straight away like this:

```python
def is_even_boolean(num):
    ''' (int) -> bool

    Returns whether num is even or not.

    >>> is_even_boolean(4)
    True
    >>> is_even_boolean(77)
    False
    '''
    return num % 2 == 0
```    

This way of using Boolean expression simplifies code

### Examples:

```python
def is_comfortable(temp):
    '''(number) -> bool

    Return whether temp is 22.5.'''
    return temp == 22.5

print(is_comfortable(20))

print(is_comfortable(22.5))
```

The structure of and `if` statement

# Quiz

```python
age1 = input("How old are you? ")
age2 = input("How old is your best friend? ")


𝚙𝚛𝚒𝚗𝚝(𝚒𝚗𝚝(𝚊𝚐𝚎𝟷) + 𝚒𝚗𝚝(𝚊𝚐𝚎𝟸))

x = int(age1)
y = int(age2)
print(str(x+y))

print(str(int((age1+age2))))


print(int(age1) + int(age2))


cents = 34
not not cents > 33
cents < 10 or cents > 3
not cents *2 > 34

dollars = 18
cents = 53

dollars == 10 or not cents != 53

not dollars == 18 or not cents == 53
not dollars < 10 and cents > 15

3 <= x < 10
not (3 <= x and x < 10)

3 <= x or x < 10


num = 20
def huevo(eggs):
    if eggs % 12 == 0:
        return False
    else:
        return True

eggs % 12 == 0



import math
dir(math)
help(math.factorial)
math.factorial(8)
factorial(8)
```

# Week 4

# For Loops and Fancy String Manipulation  

Strings can be compared using operators.

```python
animal = "cat"
animal == "cat"
animal != "cat"
```
They can be compared using Operators and their order in the alphabet letter by letter: >, <, >=, <= are operators that will work

```python
"abracadabra" < "ace"
"abracadabra" > "ace"
```

Capitalization matters! Capital lettres are less than lower case letters

```python
"a" <= "A"
```

You can always compare different types for equality or inequality

```python
"s" != 3
```

But you can't order different types

```python
"s" < 3
```

You can see if a str is within another str

```python
"cad" in "abracadabra"

"c" in "aeiou"
```

and of course the order matters

```python
"zoo" in "ooze"
```

An empty str in another word and in itself

```python
"" in "abc"

"" in ""
```

The function `len()` tells you how long a str is, and it counts every character including spaces and punctuation!

```python
len("")

len("abracadabra")

len("bwa" + "ha" * 10)  # remember that order in math matters!
len("bwa" "ha" * 10)

print("bwa" "ha")
```

# Indexing and slicing

You might be interested in getting just a part of a string, e.g., the area code from a
phone number. You can do this by either slicing or indexing the string.

Each character in a string, including spaces and punctuation has an index, which is its position in the string. The character
"H" has index zero in the string "Hola", "o" has index 1.

```python
s = "Learn to Program"
s[0]
s[1]
s[5]    # the space between 'learn' and 'to'
```
The string "Learn to Program" has the following indices, with an additional index "16", which is the end of the string and equal to the `len()` of the string.

|0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|L|e|a|r|n| |t|o| |P|r|o|g|r|a|m|

A string can also be indexed from the back using negative indices.

```python
s[-1]
s[-2]
```

You can also slice the string by providing a starting and ending indices. This will create a substring from the start index
up to, **but not including**, the end index.

```python
s[0:2]  #doesn't include the second index
s[]
s[-3:-1]
s[9:16]
s[9:len(s)] # this expression is equivalent to the operation above!
s[9:]   #This is also equivalent because if the end index is omitted the default
        #is to go to the end of the string
```

If you omit the final index during slicing, the default is to go to the end of the string.
You can also use the built-in function `len()` as the end index.

The starting index can also be omitted and the default is to return the string from the beginning.
Or both indices can be omitted and the whole string is returned.

```python
s[:9]
s[:]
```

All this operations *do not* change the string. In fact, a string **cannot** be changed, they are immutable.

These will all result in errors:

```python
s[6] = "d"
s[5:7] = "run"
```
However, you can manipulate the string output and assign it to a new variable.

```python
s = s[:5] + "ed" + s[5:]
print(s)
```

# String Methods: functions inside of objects

Objects can have modules inside of them, they are called *methods*

```python
rabbit = "I'm late! I'm late! For an important date!"

rabbit.lower()
```

To know which methods are available to an object, you can use `dir(object)`. Because this object is a `str`, we can also use `dir(str)`

```python
dir(rabbit)
dir(str)
```

You can also ask for help on any of these methods. The square brackets in the help indicate optional parameters.

```python
help(rabbit.lower)
help(rabbit.count)

rabbit.count("ate")
```

We can capitalize a string, find the index where a substring is found within a string, and even give it
a start index to find that word. If the substring doesn't appear in the string, the result is **-1**.
These methods are case sensitive. To start finding from the end (right) of the string, we can use `rfind`.

```python
"computer".capitalize()
rabbit.find("late") #where does 'late' appears first
rabbit.find("late", 7)  #where does 'late' appears first, after index 7
rabbit.find("casa") #this substring is not present in rabbit and we get -1 as a result.
rabbit.rfind("late") #where does 'late' appears first from the right
```

If there is white space at the left or right of a string, you can remove it with `lstrip()` or `rstrip()`, respectively.
If we want to remove all white space, we use `strip`. Again, this expresions don't modify the string but rather produce new strings.

```python
s = "        A string with white space on the left and right.       "
s.lstrip()  #removes white space on the left
s.rstrip()  #removes white space on the right
s.strip()  #removes white space on both the left and right
```

```python
S = "Off with their heads!"
S.find("heads")

white_queen = "Jam tomorrow and jam yesterday - but never jam today."
white_queen.count("jam")
white_queen.lower().count("jam")    #Counts how many times "jam" is found ignoring letter case.
```

# For Loops Over Strings

```python
s = "Hi there!"

for char in s:
    print(char)
```

We are going to use a for loop to count the number of vowels in a string.

Write a function that does this:

```python

def count_vowels(s):
    """ (str) -> int
    Return the number of vowels in s. Do not treat the letter y as a vowel.
    >>>count_vowels("Happy anniversary!")
    5
    >>>count_vowels("xzy")
    0
    """
    number_vowels = 0   # Creates a counter, or accumulator, to add number of vowels
    for i in s: # For each character in the string
        if i in "aeiouAEIOU":   # if the current character is a vowel
            number_vowels = number_vowels + 1   # increase the counter by one
    return (number_vowels)  # Returns the total number of vowels

```

Now, write a function that collects all the vowels in a string:


```python
def collect_vowels(s):
    """ (str) -> str
    Return all vowels present in s. The letter y is not considered a vowel.
    >>>collect_vowels("Happy Anniversary!")
    'aAiea'
    >>>collect_vowels("xyz")
    ''
    """
    vowels = "" # creates an accumulator that is an empty string
    for i in s:
        if i in "aeiouAEIOU":
            vowels = vowels + i    # Adds the current vowel to the string
    return (vowels)

```

Both of the functions above use accumulators to keep track of how many instances there are of vowels.
In the first function the accumulator contains integers, while the accumulator in the second function
contains characters. Accumulators can also be of type `bool`.


## Quiz

s = 'pineapple'
s[-5:]

vehicle = 'car'
vehicle[-1]+vehicle[1]+vehicle[:1]+"e"+vehicle

# Week 5

# While Loops

Differently from a `for`, a `while` loop loops until a certain condition, e.g.,
finding a vowel, or having the user input a value.

Remember that an `if` statement relies on a boolean expression, if the boolean is
`True` the body is executed and if it's `False` the body of the function is skipped.  
The `while` loop relies on a boolean expression as well, i.e., if it's `True` the
body of the loop is executed, however, unlike the `if` statement, the `while` loop
will check the expression again once it has finished. If the condition continues
 to be `True`, the `while` loop is executed a second time. This process repeats
until the body condition is `False`.

In the example below, a variable of initial value 2 is doubled, stored, and printed.
The loop will execute until the variable is larger than 100, which makes the expression
`variable < 100` be `False`.

```python
num = 2
while num < 100:
    num = num *2
    print (num)

```

Now an example of a `while` loop to be executed on a `str` until a vowel is found:

```python
# This for loop prints the whole string
s = "HhHhello"
for char in s:
    print (char)

# This while loop will run until a vowel is found
i = 0 # Starts an accumulator that also points to the index of the string
while not (s[i] in "aeiouAEIOU"):
    print (s[i])
    i = i + 1

```

What if the string is comprised of only consonants?

```python
s = "xyz"
while not (s[i] in "aeiouAEIOU"):
    print (s[i])
    i = i + 1

```

We get an error saying that the "string index is out of range." In the above example,
the accumulator `i` finished with the value 3, but index 3 doesn't exist in the
string s! To prevent this, we have to specify when to stop the `while` loop
by adding a second part to the boolean condition. It has to check that the index
is not larger than the length of the string.

```python
i = 0
s = "xyz"
while i < len(s) and not (s[i] in "aeiouAEIOU"):
    print (s[i])
    i = i + 1

```

Notice that the second condition checking for the length of `i` was put before
the condition with the vowels. Python performs lazy evaluation of the `and` operator, which means that if the first condition is not met the second is not
evaluated.


The next example uses a while loop in a function that reads a string and stores
a substring of characters found until a vowel appears.


```python

def up_to_vowel(s):
    """(str) -> str

    Returns a substring of s from index o up to, but not including,
    the first vowel.

    >>> up_to_vowel("hello")
    'h'
    >>> up_to_vowel("there")
    'th'
    >>> up_to_vowel("xyz")
    'xyz'
    """
    before_vowel = ""
    i = 0
    while i < len(s) and not (s[i] in "aeiouAEIOU"):
        before_vowel = before_vowel + s[i]
        i = i + 1
    return before_vowel

```

Let's add a new function, notice that there are no examples because the function
relies on user input and we can't predict what that will be.

```python

def get_answer(prompt):
    """(str) -> str
    Use prompt to ask the user for a "yes" or "no" answer and continue asking
    until the user gives a valid response. Return the answer.
    """
    answer = input(prompt)
    while not (answer == "yes" or answer == "no"):
        answer = input(prompt)
    return answer

    # >>> get_answer("Are you tired? ")
```

# How to properly comment your code

Start a line with a pound/hash character (`#`) so that's ignored. Try to write
informative comments that make a *relationship* among the variables in your code.
Comments don't need to explain how the code is doing its job, but rather describe
the purpose of the function and what is does, and describe the relationships between the variables.  

Using one of the `while` loops from above, we can write the following comments:


```python
# before_vowel contains all the characters found in s[0:i]
before_vowel = ""
i = 0

# Accumulate the non-vowels at the the beginning of the string
while i < len(s) and not (s[i] in "aeiouAEIOU"):
    before_vowel = before_vowel + s[i]
    i = i + 1
return before_vowel

```

# Type List

Lists are created with square brackets and comma separated items/values. The
items in a list can be indexed or sliced just as with a string.

```python
grades = [80, 90, 70]
grades[0]
grades[1]
grades[2]
grades[0:2]
grades[1:2]
```

One can also use the `in` operator with lists, as well as `len`, `min`, `max`, and `sum`

```python
80 in grades
60 in grades

len(grades)
min(grades)
max(grades)
sum(grades)
```

Lists can also contain `str`, and some of the same operators can be used on them.

```python
subjects = ["bio", "cs", "math", "history"]
len(subjects)
min(subjects)   # Uses order in a dictionary
max(subjects)   # Uses order in a dictionary
sum(subjects)   # Produces an error
```

List can contain data from different types

```python
street_address = [10, "Main Street"]
```

## For loops over Lists

Just as with strings, `for` loops can go over a Lists

```python
for i in grades:
    print (i)

for item in subjects:
    print (item)

```

# List methods

**Reminder:** A methods is a function inside an object.
To see which methods are available to a list, use `dir(list)`.

We are going to keep track of someone's favorite colors:

```python
# Create an empty list
colors = []

# Create a variable with some text to be displayed to the user
prompt = "Enter another of your favorite colors (type return to end): "

# Accumulate the colors typed at the prompt
color = input(prompt)

while color != "":
    colors.append(color)
    color = input(prompt)
```

Now let's say that we need to add some more items in the list, we do it with the
methods "list.extend" or "list.append". `.extend` **expects a list as the only argument**,
e.g., `list.extend([newitem1, newitem2])`, whereas `.append` is used directly onto
the list with an object as the only one argument, e.g., `list.append(newitem1)`

```python

colors.extend("hot pink", "neon green") # Error because there are two arguments
colors.extend(["hot pink", "neon green"])   #OK because the argument is one list

print (colors)

colors.append("sky blue")

print (colors)
```

To remove the item at the end of the list (or using indexing to remove from anywhere),
we can use "list.pop". This method not only removes the last item, it also **returns*** it and you can assign it to a variable. This type of functions that
both returns information and has an effect on data, are functions to said to have
side effects. Another way to delete items from a list is to use the "list.remove"
method. `.remove` works on an **object** not an index and returns an error if that
objects is not present in the list.

```python
colors.pop()
colors

colors.pop(2)
colors

colors.remove("black")  # Gives error
colors.remove("blue")
colors
```

If you want to evaluate the list before calling a method that might produce an error:

```python
if "yellow" in colors:
    colors.remove("yellow")

```

Here are some other methods that can be used in lists:

```python
colors.extend(["gray", "purple"])
colors
colors.sort()   # Doesn't return anything but it modifies the list
colors
colors.reverse() # Doesn't return anything but it modifies the list
colors

# Adding new items without replacing other items, just shifting them
colors.insert(-2, "brown")  # Inserts brown in index -2
colors
```

To remove an object from a list, we can do it with its index and the method
`.pop()`. To find out its position in the list, we can use the `.index()` method. However, this method can crash if the object is not in the list.
We do an `if` statement first to find out if its present, and if it is, remove it.

```python
colors
colors.index("yellow")  # Produces an error because yellow is not present
colors.index("brown")

if "brown" in colors:
    position = colors.index("brown")
    colors.pop(position)
colors
```

# Mutability and Aliasing

An object in a list can be modified directly by changing its memory address.


```python
list1 = [2, 4, 6, 8, 10]
list1
list1[2] = 5
list1
```

If two variables contain the same memory address it's called aliasing.

```python
list2 = list1
```

The interesting thing is that if an object in one list changes, **it will change
on the other list too.**

```python
list1
list1[-1] = 17
list1
list2
```

This not only happens with assignment but can also happen if a function is ran
on a list and it modifies the data, e.g., a function that doubles a number.

So far, the only mutable type we have learned is `list`, and immutable types are
`int`, `flot`, `str`, `bool`. Be very careful when writing DocStrings for functions
that act on mutable types and that modify the data of the object.


# Range

The build-in function `range` can be very useful because it gives you sequences
of numbers that represent the indices of strings or lists.
The function `range` goes up to but not included the last number. The "step", or
difference between any two values in the sequence is 1 by default.

```python
for num in range(10):   # Doesn't include 10!
    print (num)
```

The `help(range)` shows that the function can accept up to three arguments. An
optional starting value, the required end value, and an optional step.

```python
s = "computer science"
len(s)

# To print all indices
for i in range(len(s)):
    print(i)

# To print indices starting from index 1
for i in range(1, len(s)):
    print(i)

# To only get odd indices

for i in range(1, len(s), 2):
    print(i)
```


# Quiz


1)
```python
len([1, 2, 3]) == len(["a", "b", "c"]) #Esta

[1, 2, 3] in len("mom")
len("mom") in [1, 2, 3] # esta

l = ["mom", "dad"]
"a" in ["dad"]

"3" in [1, 2, 3]

int("3") in [len("a"), len("ab"), len("abc")] # esta
```

2)

```python
def mystery(s):
    i = 0
    result = ''
    while not s[i].isdigit():
        result = result + s[i]
        i = i + 1
    return result

mystery("abc") # Esta
mystery("abc123")
mystery("123")
mystery("123abc")
```

3)

```python
def example(L):
    """ (list) -> list
    """
    i = 0
    result = []
    while i < len(L):
        result.append(L[i])
        i = i + 3
    return result

x = example(["abracadabra"])

```
4)

```python
def compress_list(L):
    """ (list of str) -> list of str

    Return a new list with adjacent pairs of string elements       from Lconcatenated together, starting with indices 0 and 1,    2 and 3,and so on.

    Precondition: len(L) >= 2 and len(L) % 2 == 0

    >>> compress_list(['a', 'b', 'c', 'd'])
    ['ab', 'cd']
    """
    compressed_list = []
    i = 0

    while i < len(L):
        compressed_list.append(L[i] + L[i + 1])
        # MISSING CODE HERE

     return compressed_list

```

5)

What is the sum of the **𝚎𝚟𝚎𝚗** (sometimes it changes to **odd**) numbers from 524 through 10508, inclusive? Hint: write a `𝚠𝚑𝚒𝚕𝚎` loop to accumulate the sum and print it. Then copy and paste that sum. For maximum learning, do it with a `𝚏𝚘𝚛` loop as well, using `𝚛𝚊𝚗𝚐𝚎`.

### While loop

```python

### # It runs but gives me a larger result!!!
i = 524
result = 0
while i <= 10508:
    result = result + i
    i = i + 2

result
```


### For loop
```python
# For loop is correct
result = 0
for i in (range(524, 10508, 2)):
    result = result + i

result

# 27530880
```

6)


```python
def while_version(L):
    """ (list of number) -> number
    """
    i = 0
    total = 0
    while i < len(L) and L[i] % 2 != 0:
        total = total + L[i]
        i = i + 1
    return total

# This for loop does the same

def for_version(L):
    found_even = False
    total = 0

    for num in L:
        if num % 2 != 0 and not found_even:
            total = total + num
        else:
            found_even = True

    return total
```

10)

```python
a = [1, 2, 3]
b = a # THIS IN AN ALIAS!!! NOT AN ASSIGNMENT!!!!
#Missing

print(a, b)
#print: [1, 'A', 3] [1, 'A', 3]

b[-2] = "A" #este

b[1] = "AB"
a[1] = a[1][0] # esto hace index del index!
```

11)

```python
a = [1, 2, 3] # NO alias! both variables are independent
b = [1, 2, 3]
# MISSING CODE HERE
print(a, b)
#print: [1, 'A', 3] [1, 'A', 3]

a[1] = "A"
```

12)

```python
def increment_items(L, increment):
    i = 0
    while i < len(L):
        L[i] = L[i] + increment
        i = i + 1

values = [1, 2, 3]
print(increment_items(values, 2)) # Doesn't return anything so it's none
print(values)

# answer

# None
# [3, 4, 5]
```

# Week 6

## For Loops Over Indices

Looping through indices can be very useful. For example, we can count the number
of neighboring pairs of characters that are the same in a string. To do this,
 index zero `s[0]` has to be compared to index 1 `s[1]`, and index 1 `s[1]` to
 index 2 `s[2]`, etc., until the second to last index `s[-2]` is compared to
 the last index `s[-1]`. This can be generalized as: `s[i], s[i + 1]`

```python

s = "abccdeffggh"

def count_adjacent_repeats(s):
    """(str) -> int
    Return the number of occurrences of a character and an adjacent character
    being the same.
    >>> count_adjacent_repeats("abccdeffggh")
    3
    """
    repeats = 0
    for i in range(0, len(s) - 1):  # goes from 0 to second last character of str. If it's left as len(s), it will be out of range when it tries to compare the last index to nothing.
        if s[i] == s[i + 1]:
            repeats = repeats + 1
    return repeats

print (count_adjacent_repeats("hgbbtyffs"))

```

The code above works because it goes through each index and knows what to compare
it to.

Now, write a function that shifts the items in a list one position to the left.
For example, if the character "b" is in position/index 1, it's shifted to index 0.
Whatever item that was in index 0 is shifted to the last position.


My version is below:

```python

L = ["a", "b", "c", "d"]

def shift_left(L):
    """(list) -> NoneType   # Modifies the list be doesn't return anything
    Shift each item in L one position to the left and shift the first item
    to the last position.

    Precondition: len(L) >= 1

    >>> shift_left(L = ["a", "b", "c", "d"])
    ['b', 'c', 'a']

    """
    for i in range(1):
        L.insert(len(L), L[i])
        L.pop(i)


```

Course's Version:

```python
L = ["a", "b", "c", "d"]

def shift_left(L):
    """(list) -> NoneType   # Modifies the list be doesn't return anything
    Shift each item in L one position to the left and shift the first item
    to the last position.

    Precondition: len(L) >= 1

    >>> shift_left(L = ["a", "b", "c", "d"])
    ['b', 'c', 'a']

    """
    first_item = L[0]   # Keeps track of the first item
    for i in range(1, len(L)):
        L[i - 1] = L[i] # Assigns the item to the right to the item on the left
# e.g., if i is 1, then 1-1 = 0 (first index of list) and it gets what's on index 1
    L[-1] = first_item  # Assigns what used to be the fist item to the last position.

```

# Parallel Lists and Strings

Now we'll use indices to access the items of corresponding positions in two different
lists and the items of corresponding positions in two different strings.

For example in the lists and code below:

```python
def sum_items(list1, list2):
    """(list of numbers, list of numbers) -> list of numbers

    Return new list in which each item is the sum of the items at the
    corresponding position on list1 and list2.

    Precondition: len(list1) == len(list2)

    >>>sum_items([1, 2, 3], [2, 4, 2])
    [3, 6, 5]
    """
    sum_list = [] # empty list
    for i in range(len(list1)): # this will generate values from 0 up to but nothing
    # including the length of the list. This works because len(list) -1 is the
    # last index of the list!
    # We could have picked the other list too because they are the same length
    # given the precondition.
        sum_list.append(list1[i] + list2[i])
    return sum_list

```

**Note:** If the lists are not the same length and violate the precondition of the
function, the results will be wrong. If list1 is shorter, then the indices generated
won't cover the length of list2 and the resulting list will be shorter.
If list2 is shorter, then the additional indices from list1 will be out of range
and it will result in an error.


Let's work with parallel strings now with the following example.


```python
def count_matches(s1, s2):
    """(str, str) -> int

    Return the number of positions in s1 that contain the same character at the
    corresponding position of s2.

    Precondition: len(s1) == len(s2)

    >>>count_matches("ate", "ape")
    2
    >>>count_matches("head", "hard")
    2
    """
    final_count = 0
    for i in range(len(s1)):
        if s1[i] == s2[i]:
            final_count = final_count + 1
    return final_count



```


# Nested Lists

A list can contain items of any kind, even other lists! These are called nested lists.  

```python

# One list with three items, each a list with two items
grades = [["Assignment 1", 80], ["Assignment 2", 90], ["Assignment 3", 70]]
len(grades)

# Get the first list at index 0
grades[0]
# Length of one of the items or nested lists
len(grades[0])

# Shows length of each nested list
for i in range(len(grades)):
    len(grades[i])
# Prints each nested list
for item in grades:
    print (item)

# Indexing the first item and the first item of the nested list
grades[0][0]
grades[2][1]

```

```python

def calculate_average(asn_grades):
    """(list of list of [str, number]) -> float

    Return the average of the grades in asn_grades

    >>>calculate_average([["A1", 80], ["A2", 90]])
    85.0

    """
    total = 0.0
    for item in asn_grades:
        total = total + item[1]
    return total / len(asn_grades)

```


# Nested Loops

The body of a `for` loop can have anything including other `for` loops.
After the first itineration of the outer, the inner loop is executed and it doesn't stop until it has gone through all its iterations. After it's done, the outer loop
goes to its second iteration and goes into the inner loop again.

```python
for i in range(10, 13):
    for j in range(1, 5):
        print(i, j)

```

Another example, keep track of a list of list of numbers. Get the average for each
list.

```python
grades = [[70, 75, 80], [70, 80, 90, 100], [80, 100]]

def averages(grades):
    """(list of list of num) -> list of float
    Return a new list in which each item is the average in the inner list at the
    corresponding position of grades.

    >>>averages([[70, 75, 80], [70, 80, 90, 100], [80, 100]])
    [75.0, 85.0, 90.0]
    """

    final_averages = []
    for grades_list in grades:
        # Calculate average of grades_list and append it to final_averages
        total = 0
        for mark in grades_list:
            total = total + mark
        final_averages.append(total / len(grades_list))
    return final_averages

averages(grades)
```


# Reading Files

Instead of reading information from standard input, most of the times you are going
to be reading it from files. There are four ways to read in a file into Python.

The first one is with the built-in function `open`, which takes two arguments:
1) the **filename**, either just the name if in the same directory or the full path,
and 2) the **mode** which tells Python to read (`r`), write (`w`), or append (`a`).

```python
# Creates variable with path to file
test_filename = "/Users/SAI/Documents/!Online_Courses/Coursera_Learn_to_Program_The_Fundamentals_May_2017/Week6/File_Example.txt"

test_file = open(test_filename, "r")

# Reads the next line including the symbol for new line (if exists)
test_file.readline()

# If you keep calling it, it keeps reading the next line, including blank lines
test_file.readline()
test_file.readline()

```

The method `readline()` reads the next line in a file, including the symbol for
newline `\n` if it exists. If you keep calling this method, it keep returning the
next line even if it's a blank line. When it has reached the end of the file, it
will return an empty string.  
You can close a file with `.close()` and also use a `while` loop to read all of it.

This method is useful when you want to process **only part of the file.**


```python
test_file.close()

test_file = open(test_filename, "r")

line = test_file.readline()

while line != "": # not equal to empty string (end of file)
    print(line)
    line = test_file.readline()

```

The code above print every line but adds empty lines in between each line. This
is because we have the symbol for newline and `print` also adds a new line!  
To prevent this behavior, we have to specify to `print` to use an empty string
instead of a new line.

```python
test_file.close()

test_file = open(test_filename, "r")

line = test_file.readline()

while line != "": # not equal to empty string (end of file)
    print(line, end = "")
    line = test_file.readline()

test_file.close()

```

You can use a `while` loop to read a section you are interested in.

```python
test_file = open(test_filename, "r")

line = test_file.readline()

while line != "\n": # not equal to newline. Reads first paragraph.
    print(line, end = "")
    line = test_file.readline()

```

Use a `for` loop to easily read every line in a file, **one at a time:**

```python
test_file = open(test_filename, "r")

line = test_file.readline()

for line in test_file:
    print(line, end = "")

```

If the file is not too big, you can read the whole file with the method `read`,
which return the entire file as a single **string.**

```python
test_file = open(test_filename, "r")

print(test_file.read())

text = test_file.read()
len(text)
type(text)
```

The fourth way to read a file is with the method `readlines()`, which returns a
**list** of all the lines in a file. Because it's a list, you can access items
using indexing.

```python
test_file = open(test_filename, "r")
test_file.readlines()

text = test_file.readlines()
type(text)
len(text)

text[2]

for line in test_file:
    print(line, end = "")

```

# Writing Files

Use the same function `open` as above but this time use the `mode("w")`. The writing
mode acts similarly to `print` except that it doesn't add a newline character.

In this example, we'll use the module `tkinter.filedialog` to ask the user for
a file and to write it.

```python
import tkinter.filedialog
#This will open a window to select the file and returns the path of that file
tkinter.filedialog.askopenfile()

#Save to variable, it's just the path! However, it's saved as class
# '_io.TextIOWrapper'. To get only the path, use `from_filename.name`.
# You can also use tkinter.filedialog.askopenfilename()!!
from_filename = tkinter.filedialog.askopenfile()

type(from_filename)
from_filename.name

#To save the file. It will prompt a window where to save the file and what name
# This is returning the path where the new file will be saved.
to_filename = tkinter.filedialog.asksaveasfile()

#Only path, no class "'_io.TextIOWrapper'
to_filename.name

from_file = open(from_filename.name, "r")

from_file
contents = from_filename.read()

from_file.close()

contents
type(contents)

# Open the file that we want to write to
to_file = open(to_filename.name, "w")
to_file.name

to_file.write("Copy\n") # Returns the characters that have been written, includes \n

to_file.write(contents) # Returns the characters that have been written, includes \n

to_file.close

```

Keep in mind that the `write` method doesn't append newlines automatically! You
need to specify that you want breaks between the lines we are writing. You do this
with the symbol `\n`, e.g., `to_file.write("First line of text\n")`

# Developing a Program from Scratch

This lecture doesn't introduce any new concepts, rather shows the steps and
thought process of writing a program from beginning to end.

In this example, we are working with a list of students and their grades. We want
to create a distribution of the grades in ranges from 0-9, 10-19, etc., 100. We'll
make a list with one column with the ranges and one with stars for every grade
that fits that range.

We'll need the following steps:

1. Read file into a list
2. Count the grades per range
3. Write the histogram to a file

Writing the general steps and breaking the problem into smaller tasks makes it
easier to accomplish the goal. It also takes you away from the programing and
helps you think of what you need to do.

Run the program often and print lines and variables to check if things are working
like you think they are. It will save you a lot of time debugging later!

It's good practice to keep the functions and the program in a separate files.
You'll need to import the functions you create!

```python
import tkinter.filedialog
import grade

# Gives user the option of selecting a file
a1_filename = tkinter.filedialog.askopenfilename()

# Reads the file
a1_file = open(a1_filename, "r")

# Check if everything is there, delete after you know it is.
#for line in a1_file:
#    print(line)


a1_histfilename = tkinter.filedialog.askopenfilename()

# Reads the file
a1_histfile = open(a1_histfilename, "r")


# Read the grades into a list

# Count the grades per range

# Write the histogram to the file

"""
0-9:    *
10-19:  **
20-29:  ****
  :
90-99:  **
100:    *
"""

```

**Didn't finish the video on developing a program***


# Quiz


```python
for i in range(0, 50, 3):
    print(i)


def merge(L):
    merged = []
    for i in range(0, len(L), 3):
        merged.append(L[i] + L[i + 1] + L[i + 2])
    return merged

print(merge([1, 2, 3, 4, 5, 6, 7, 8, 9]))


line = "La casa rosada"
line.startswith("L")

```

# Week 7

# Tuples

A list is an mutable sequence, an immutable sequence is called a tuple. Tuples
use the same index notation than lists. If you slice a tuple you create a tuple.


```python

tup = ("a", 3, -0.2)
tup[0]
tup[-1]

tup[:2] #up to but not including index 2!
tup[1:3]

# The following produces a TypeError because tuples can't be changed.
# You can't assign anything to a tuple (immutable)
tup[0] = "b"
```

Because of the immutability of tuples, they only have the methods `count` and `index`.

You can iterate over a tuple, function `len` works too, and you can iterate over
the indices of a tuple.


```python
for i in tup:
    print(i)

len(tup)

for i in range(len(tup)):
    print(tup[i])

```

Tuples are created with comma separated values inside parenthesis. To create a one
value tuple, put a comma after the value. Empty tuples don;t require the comma.


```python
(1, 2)
(1,)
()

```

# Type Dict

Dictionaries store information that we can access quickly. We learned to access
nested lists with indexing before but using a dictionary is simpler.  
The notation for a dictionary are braces `{}`. In an dictionary, each key (or item)
of the dictionary is divided by commas `,`and the value within that key is separated
from the key itself by a colon `:`. Keys in a dictionary **_must_** be unique! Values may be the same.
Keys are always on the left-hand side of the colon `:`.


```python
grades = [["A1", 80], ["A2", 70], ["A3", 90] ]

# Using indexing

# Get name of sublist 1
grades[0][0]

# Get grade of sublist 1
grades[0][1]

# Using a dictionary
# Key1 = A1 and it's value is 80
asn_to_grade = {"A1" : 80, "A2" : 70, "A3" : 90}

# To look up a value in the dictionary, use its key.
asn_to_grade["A2"]

```

If a key is not present in a dictionary we'll get a KeyError. You can first see
if a key exists in the dictionary with `in`. Keep in mind that `in` only looks for
keys and _not_ values.


```python
# This will give a KeyError
asn_to_grade{"A4"}

# This only checks for
"A4" in asn_to_grade    # False
"A2" in asn_to_grade    # True
80 in asn_to_grade  #False

```
Like lists, dictionaries are mutable, you can add, modify, and remove keys.

```python

# Adding keys and values
len(asn_to_grade)

asn_to_grade["A4"] = 85

len(asn_to_grade)
asn_to_grade

# Modifying
asn_to_grade["A4"] = 90

# Removing
del asn_to_grade["A4"]
len(asn_to_grade)
asn_to_grade["A4"]  #KeyError
```

Iterating over a the keys of a dictionary is easy with a `for` loop. Notice that
the order in which the keys are printed **doesn't** match the order they were added
in.

```python
# To print the keys of a dictionary
for assignment in asn_to_grade:
    print(assignment)

# To print the values within the keys
for assignment in asn_to_grade:
    print(asn_to_grade[assignment])

# Print both the keys and their values, passing two arguments to print
for assignment in asn_to_grade:
    print(assignment, asn_to_grade[assignment])

```

A dictionary can be empty and of `len` zero. The types and values that a dictionary
can have don't have to match. The only requirement for keys is that they are
immutable, e.g., `int`, `str`. If you try to have a list, which is mutable, as a
key, it will result in an error. To use a sequence as a key, we can use a tuple,
because tuples are immutable.

```python
# Empty dictionary of length 0
d = {}

# Keys of different types that are immutable
d = {"apple" : 67, 5 : 78}

# This will give an error because a list is mutable and can't be a key
d[[1, 2]] = "banana"

# Using a tuple
d[(1, 2)] = "banana"

```

# Inverting a Dictionary

You can use a dictionary as an accumulator


```python

# indentation is not necessary but it looks nicer
fruit_to_color = {
    "banana" : "yellow",
    "chery" : "red",
    "orange" : "orange",
    "pear" : "green",
    "peach" : "orange",
    "plum" : "purple",
    "pomegranate" : "red",
    "strawberry" : "red"}

#Not sorted by neither key or value
fruit_to_color

fruit_to_color["banana"]

# Iterate to get both the key and values
for fruit in fruit_to_color:
    print(fruit, fruit_to_color[fruit])

```

Now imagine that we want to build a new dictionary that maps colors to fruits,
which is the inverted dictionary we have. If we do a straight inversion, like the
first `for` loop below, we are going to loose some entries because the keys are
identical and they get overwritten! To get around this, we need to map the colors
to a list of fruits of that color.

```python
# Invert the dictionary

# This will create a dictionary with identical keys that get overwritten
color_to_fruit = {}

for f in fruit_to_color:
    color_to_fruit[fruit_to_color[f]] = f
# or this option
    color = fruit_to_color[f]
    color_to_fruit[color] = fruit

# Doing it with a list
color_to_fruit = {}

for fruit in fruit_to_color:
    color = fruit_to_color[fruit]
    
    # If color is not already a key in the accumulator, add color : [fruit
    if not (color in color_to_fruit):
        color_to_fruit[color] = [fruit]
    
    # Otherwise, append fruit to the existing list.
    else:
        color_to_fruit[color].append(fruit)

color_to_fruit

# What fruits are orange?
color_to_fruit["orange"]

# How do we get to the fruit orange?
color_to_fruit["orange"][1] # First part gives list, then index the list

# How to get to cherry?
color_to_fruit["red"] # gives a list of red fruits
color_to_fruit["red"][-1] # indexing the last item of the list, which is cherry

```

# Populating a Dictionary

We are going to read a file and store it in a dictionary.


```python
def read_grades(gradefile):
    """(file open for reading) -> dict of {float: list of str}

    Read the grades from a gradefile and return a dictionary where each grades
    is a key and each value is the list of IDs of students who earned that grade.

    Precondition: gradefile starts with a header that contains no blank lines, 
    then has a blank line, and then lines containing a student number and a grade.

    """
    # Skip over the  header
    line = gradefile.readline()
    while line != "\n": # while the line is not a new line (the blank line)
        line = gradefile.readline() # Read the file
    
    # Read the grades and accumulate them into a dictionary
    grade_to_id = {} #Acuumulator
    
    line = gradefile.readline()
    
    while line != "":   #Keep reading until empty string, which is the end of file
        
        student_id = line[:4] # slice the line from beginning up to the 4th
                              #character, same length as students IDs
        grade = float(line[4:].strip()) # Take the rest of line from 4th index to
                                        # end, and strip whitespace before and
                                        # after. Also make it into a float
        
        # For grades that are not yet keys in dictionary
        if grade not in grade_to_id:
            grade_to_id[grade] = [student_id] #student_id needs to be a list
            # Assign student_id because it's the value to the key `grade`
        else:
            grade_to_id[grade].append(student_id) #Append if already there
            
        line = gradefile.readline()
        
    return grade_to_id
    

gradefile = open("/Users/SAI/Documents/!Online_Courses/Coursera_Learn_to_Program_The_Fundamentals_May_2017/Week7/grades_example.txt")


read_grades(gradesfile)

```

# Quiz

```python
d = {'a': [1, 3], 'b': [5, 7, 9], 'c': [11]}
len(d)
len(d["b"])
len(d["a"] + len(d["c"]))


{1: 10, 1: 20, 1: 30}

```

# Final exam

```python

a = 7
b = a + 3
a = 9
b


first = 'pwn'
second = 3
third = 'd'

first+str(second)+third


def same_length(L1, L2):
    '''(list, list) -> bool

    Return True if and only if L1 and L2 contain the same number of elements.
    '''
    return len(L1) == len(L2)

    #if len(L1) == len(L2):
    #   return True
    #else:
    #   return False
    
d = {0: 10, 1: 20, 2: 30}
d = {1: 10, 2: 20, 3: 30}


def double_last_value(L):
    '''(list of int) -> NoneType

    Double the value at L[-1]. For example, if L[-1] is 3,
    replace it with 6.

    Precondition: len(L) >= 1.
    '''
    L1 = [1, 3, 5]
    double_last_value(L1)
    print(L1[-1])
    
8 % 6

def get_negative_nonnegative_lists(L):
    
    nonneg = []
    neg = []
    for row in range(len(L)):
        for col in range(len(L)):
            if L[row][col] > 0:
                nonneg.append(L[row][col])
            else:
                neg.append(L[row][col])
    
    return (neg, nonneg)

    '''(list of list of int) -> tuple of (list of int, list of int)

    Return a tuple where the first item is a list of the negative ints in the
    inner lists of L and the second item is a list of the non-negative ints
    in those inner lists.

    Precondition: the number of rows in L is the same as the number of
    columns.

    >>> get_negative_nonnegative_lists([[-1,  3,  5], [2,  -4,  5], [4,  0,  8]])
    ([-1, -4], [3, 5, 2, 5, 4, 0, 8])
    '''




```
