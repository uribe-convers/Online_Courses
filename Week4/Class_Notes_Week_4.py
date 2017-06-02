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

len("bwa" + "ha" * 10) #remember that order in math matters!
len("bwa" "ha" * 10)

print("bwa" "ha")
```

# Indexing and slicing
