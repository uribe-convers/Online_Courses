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

Writ a function that does this:

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
