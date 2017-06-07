# Week 5

# While Loops

Differently from a `for loop`, a `while loop` loops until a certain condition, e.g.,
finding a vowel, or having the user input a value.

Remember that an `if` statement relies on a boolean expression, if the boolean is
`True` the body is executed and if it's `False` the body of the function is skipped.  
The `while loop` relies on a boolean expression as well, i.e., if it's `True` the
body of the loop is executed, however, unlike the `if` statement, the `while loop`
will check the expression again once it has finished. If the condition continues
 to be `True`, the `while loop` is executed a second time. This process repeats
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

Now an example of a `while loop` to be executed on a `str` until a vowel is found:

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
string s! To prevent this, we have to specify when to stop the `while loop`
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
