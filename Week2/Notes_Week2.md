# Data Structures

## List

Create a sequence of values separated by commas within square brackets. The values
don't need to be the same type.

For example, it can be this gene expression information:

```python
["gene", 5.16e-08, 0.000023373, 7.33e-08]
```

You can place this information in a variable:

```python
gene_expression = ["gene", 5.16e-08, 0.000023373, 7.33e-08]
```

Elements in a list can be changed, they are mutable data types, as opposed to strings (immutable).

```python
gene_expression[0] = "Lif"
print(gene_expression)
```

Lists can be indexed like other variables, either from the beginning or the end.

```python
# third element in the list
gene_expression[2]
# last element in the list
gene_expression[-1]
```

List can also be sliced and the results is a new list containing the slice.

```python
gene_expression[0:2]
gene_expression[-3:]

# this following slice creates a new copy of the list
gene_expression[:]
```
You can assign a new value to a slice of a list and it will replace those values.
Or you can clear the whole list too.

```python
# replace the second and third elements with a single new value
gene_expression[1:3] = [633]
print(gene_expression)
# clear list
gene_expression[:] = []
print(gene_expression)
```

List can be concatenated using the plus sign

```python
gene_expression = ["gene", 5.16e-08, 0.000023373, 7.33e-08]

gene_expression + [345, "plant"]

# assign it to new variables
new_list = gene_expression + [345, "plant"]
print(new_list)
```

There are many built-in functions that work with lists, e.g., `len` or `del`. The built-in function `del` deletes elements from the list. If you delete the second element from a list with three elements, the third element shifts to the second position and the list becomes a two element list. The function `del` is destructive.

```python
print(gene_expression)
del gene_expression [1]
print(gene_expression)
```

List are also objects and, thus, have their own methods that allow you to do things.
