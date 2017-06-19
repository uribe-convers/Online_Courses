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

The forst one is with the built-in function `open`, which takes two arguments:
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
