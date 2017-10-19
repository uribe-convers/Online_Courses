# Week 1

# Built-in functions

What's the largest number?

```python
max(arguments)

max(68.6, 545, 454.5)
```

How to know which built-in functions exist?

```python
dir(__builtins__)
```

For help on functions

```python
help(abs)

abs(-456.8)
```

Defining your own functions

Use the following syntax:  

```python
def functionname(parameteres):  
    #body
```

for a function to elevate a number to the power of 2

```python
def f(x):
    return x ** 2

# Calling the function
f(5)
# Storing the result in a variable
result = f(3)
```

Functions can have multiple parameters

```python
def triangle_area(base, height):
    return base * height / 2
```
