# Week 5

# While Loops

Differently from a `for loop`, a `while loop` loops until a certain condition, e.g.,
finding a vowel, or having the user input a value.

Remember that an `if` statement relies on a boolean expression, if the boolean is
`True` the body is executed and if it's `False` the body of the function is skipped.  
The `while loop` relies on a boolean expression as well, i.e., if it's `True` the body
of the loop is executed, however, unlike the `if` statement, the `while loop`
will check the expression again once it has finished. If the condition continues to
be `True`, the `while loop` is executed a second time. This process repeats until
the body condition is `False`.

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
