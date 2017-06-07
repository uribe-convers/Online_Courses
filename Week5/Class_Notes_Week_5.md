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

# How to properly comment your

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
e.g., `list1.extend([newitem1, newitem2])`, whereas `.append` is used directly onto
the list with an object as the only one argument, e.g., `list1.append(newitem1)`

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
