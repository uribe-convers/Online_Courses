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
of the dictionary is divided by commas `,`, and values within that key are divided
by colons `:`. Keys in a dictionary **_must_** be unique! Values may be the same.

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
