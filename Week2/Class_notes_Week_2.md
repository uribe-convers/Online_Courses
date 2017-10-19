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
```

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
