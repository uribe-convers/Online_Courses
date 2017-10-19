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
