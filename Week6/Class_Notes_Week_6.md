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
