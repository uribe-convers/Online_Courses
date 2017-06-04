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
The string "Learn to Program" has the following indices, with the additional index 16, which is the end of the string and equal to the `len()` of the string.

|0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|L|e|a|r|n| |t|o| |P|r|o|g|r|a|m|

A string can also be indexed from the back using negative indices.

```python
s[-1]
s[-2]
```

You can also slice the string by providing a starting and ending indices. This will create a substring from the start index
up to—but not including—the end index.

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
