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

**Note:** If the lists are not the same langth and violate the precondition of the
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
