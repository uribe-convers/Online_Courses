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
