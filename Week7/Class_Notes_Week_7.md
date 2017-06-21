# Week 7

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
