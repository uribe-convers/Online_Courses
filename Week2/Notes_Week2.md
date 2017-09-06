# Data Structures: part 1

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

A useful method is `extend`, which works to add new elements. You can add many elements
that are in the form of a list.  
The method `count`,
counts how many times an element appears in a list. The `reverse` method, reverses their
elements in the list. As always, you can check the help typing `help(list)`

```python
print(gene_expression)
# adding two elements that are in a list
gene_expression.extend([777, 234])
print(gene_expression)

print(gene_expression.count("gene"), gene_expression.count(222))

gene_expression.reverse()
gene_expression
help(list)
```

The methods `append` and `pop` allow us to easily treat lists as stacks, where the
last element added is the first element retrieved (last-in, first out). These two
methods only work with one element at a time. If you `append` a list, that list
will become an element of the list.

```python
stack = ["a", "b", "c", "d"]
stack

# appending a list
stack.extend(["hu", "yu"])
stack

# this will add one element at the top of the stack, i.e., after "d"
stack.append("e")
stack

# this removes the last element that was added to the list
elem = stack.pop()
elem
```

One of the most common methods with list is sorting and there are two ways to do it.
The first one is to use the built-in function `sorted`, which will sort but it **won't**
change the variable. The other way is to use the method `sort`, which **will** 
modify the list. The method `sort` is usually more efficient, unless you need to 
keep the original list and the way the elements were entered.

```python
# using sorted
my_list = [3, 54, 12, 2, 34, 5]
sorted(my_list)
my_list

# using sort
my_list.sort()
my_list
```
Finally, the elements of the list don't have to be numbers. Python will apply an order based on the alphabet, with the uppercase letters placed first than the lowercase ones.

```python
my_list = ["a", "g", "c", "T", "A"]
sorted(my_list)
my_list.sort()
my_list
```

# Data Structures: part 2

## Tuples

Tuples work just like list with the exception that their elements are immutable.
A tuple is created by entering its values separated by commas and _either_ surrounded 
or not by parenthesis. You can use the same methods and functions we use on lists 
on tuples as long as they don't modify the tuple.

```python
t = 1,2,3
t
```
## Sets

A `set` is an **unordered** collection with no duplicated elements. Because they
are unordered, they do not have an index. Sets are constructed with curly brackets
and commas. If there is a duplicated element in the set, it will be removed.
If you have two or more sets, you can look for the `union` (combinations) 
of both sets using a pipe (`|`), or look at the intersections (shared) with the 
and sign (`&`). Finally, you can see which elements are in the first set and not
the other one (the difference) with the minus simbol (`-`).

```python
genetic_words = {"promoter", "codon", "nucleotide", "enzyme", "promoter", "DNA"}
genetic_words

genomic_words = {"DNA", "histone", "locus", "nucleotide"}
genomic_words

# union
genetic_words | genomic_words

# intersection
genetic_words & genomic_words

# difference
genetic_words - genomic_words
```
## Dictionaries

Data structure where you store data that you want to look up later. You store a 
pair of values. The value you use to look up values with the `key` and a `value`
is what is associated with that `key`, sort of a word (key) and its meaning (value)
in a traditional dictionary.  
The key can be any immutable types, like `str` and `numbers`, and the values can
be any type.  
To create a dictionary, we give it a name and wrap everything in curly brackets. 
Then, each key (a string or number) will be associated with a value by separating them 
with a colon `:`. Every key-value pair is separated by commas.  
To access the values in a dictionary, you use the `key` within square brackets to
obtain its value. If you try to call a key that doesn't exist in a dictionary, 
you'll get an error. To check if a key is present in a dictionary: `"key" in dictionary_name`


```python
# create a dictionary
transcriptome_motif = {"gene1" : "aaagtt", "gene2" : "cgcatcga", "gene3" :  "actcatc"}

# retrieving value from akey
transcriptome_motif["gene2"]

# using it in a sentence
print("Studying this transcriptome, I discovered that the sequences for one gene was %s" % transcriptome_motif["gene2"])

# check for key in dictionary
"gene4" in transcriptome_motif
"gene3" in transcriptome_motif
```

To update a dictionary you need a new key and value. Do this by calling the dictionary
and the new key in square brackets and assign a new value. Existing entries can
also be modified by assigning anew value to an existing key. A key can be deleted
from the dictionary suing `del`. You can add multiple key at once by using the method
`update`, as in `dictionary_name.update`. Keys can be already in the dictionary and
Python will update those keys.  
To know how long the dictionary is, use the function `len`.  
To get all the key in a dictionary, use the method `.keys`. Get it as a list by
wrapping everything within the list function: `list(dictionary_name.keys())`. Similarly, 
use the method `.values` to get all values. The values can be `sorted` too.

```python
#adding a new key and value to dictionary
transcriptome_motif["gene4"] = "gcgctagc"

# modifying a value
transcriptome_motif["gene4"] = "aaaaaaaa"

# deleting a key
del transcriptome_motif["gene4"]

# adding multiple keys
transcriptome_motif.update({"gene5" : "ggggggg", "gene6" : "tttttttt", "gene3" : "cccccc"})
transcriptome_motif

# size of a dictionary
len(transcriptome_motif)

# getting all keys in dictionary as a list
list(transcriptome_motif.keys())

# getting all values in dictionary as a list
list(transcriptome_motif.values())
# sorted
(list(transcriptome_motif.values()))
```

## Ifs and Loops: part 1

The basic idea is that some code is executed _if_ a condition is met and other code 
is executed when the condition _is not_ met.

```python
if condition_is_true:
    some code
else:    
    some other code
```

```python
dna = input("Enter DNA sequence: ")

if "n" in dna:
    nbases = dna.count("n")
    print("There are %d unidentified bases" %nbases)

```
