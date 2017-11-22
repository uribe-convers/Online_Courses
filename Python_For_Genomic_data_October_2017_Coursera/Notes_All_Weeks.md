# Week 1

# Python and Genomic Data

## Strings

Something that is important to remember is that DNA and proteins are just strings
of characters where the alphabet contains either four or 20 letters, respectively.
As such, these type of biological data can be treated as `str`.

Triple quotes are very useful for DNA sequences that are very long or for datasets
that contain multiple DNA sequences, e.g., a fasta file with multiple sequences.
If you write this at the prompt, you will get the string separated by the
newline character `\n`, so it's better to use the function `print`.

```python
# At the prompt
"""
>dna1
ATGTACTAGCATGCCTGACGTACAGTCA

>dna2
GCTACTAGCATGCA
"""

# Notice the backslash after the initial quotes, this omits printing a new line
# at the beginning.
print("""\
>dna1
ATGTACTAGCATGCCTGACGTACAGTCA

>dna2
GCTACTAGCATGCA
""")
```

## String operators

Concatenate: +  
Replicate: *  
Present in string: in  
*Not* present in string: not in  

```python
"atg" + "gatcg"

"atg" * 3

"atg" in "gtcagtcggcatgcgatcgc"

"n" in "gtcagtcggcatgcgatcgc"

"n" not in "gtcagtcggcatgcgatcgc"

```

## Variable

Very useful to store information. The name "variable" refers to its ability to
change. The names of the variables should be informative, can't start with a
number or have special characters (i.e., #, @), and are case sensitive.

## Indexing and Slicing

Use indexing to retrieve a character at a specific location in a string, i.e.,
x[index], or use slicing to retrieve a substring between positions a and b in
the string, i.e., x[start:end]. Note that the end position is **not** included.  
Use negative indexing to start from the end of the string. You can also omit the
start or end positions when slicing to retrieve the string from the beginning or
all the way to the end, respectively.

```python
dna = "cgatgcatgcacgctgcagtcgcagcatggta"

dna[0]
dna[15]
dna[-1]
dna[5:17]
dna[:6]
dna[5:]

```

## Some built in functions

`print()` = prints variables

`len` = returns the length of a variable

`type` = tells you what type you have

You can a list of the built in functions by typing `dir(__builtins__)`, and then
getting information about a specific function with `help(function)`.

Objects have attributes too, and they are called methods.

`str.method` or `dir(str)`

Some examples are `str.count()`, `str.upper()`, `str(sort)`, `str(find)`,
`str.replace` etc.

## First Python Program

Write a program to compute the GC content in a sequence


```python
dna = "cgatgcatgcacgctgcagtcgcagcatggta"

num_C = dna.count("c")
num_G = dna.count("g")

total_length_dna = len(dna)

GC_content = (num_C + num_G) * 100.0 / total_length_dna

print (GC_content)

```

To be more efficient and be able to use other code we've written, save the code
in a file. Then you can call it by typing `python ProgramName.py`, or if you add
the path of python at the beginning of your code with `#!/usr/bin/python`, you
can just type `./ProgramName.py`. Finally, you can call the program from another
program by importing it as a module with: `import filename` without the extension.
The file needs to be in the same directory.


## Code Commenting

It's very important to add comments to your code so that you or others can
figure out what your program does. You can do this in two ways: 1) using the
hash or pound character (`#`) or 2) with triple quotes, text, triple quotes:

```python
# Single line comment

"""This is a comment
that can be a
few lines long
"""
```

## Reading Input and String Conversion

Instead of typing at the prompt, you can ask the user to type it in.

In Python2 we do this with `raw_input` in Python3 is `input`. This input is
***always*** captured as a string! You can convert it to other types using
`int()`, `float()`, `str()`, `chr()`, `complex()`. The type `chr` referrers to the
actual character assigned to each key on the keyboard depending on its number,
e.g., chr(65) -> A.

```python
dna = input("Enter a DNA sequence, please: ")
dna

# Always strings even with numbers!
my_number = input("Pease enter a number: ")
my_number
type(my_number)

my_number = int(my_number)
my_number
type(my_number)
```

The print function has some functionalities and format options. For example, you
can give it many parameters, including variables, separated by commas and it will
print them all nicely.

```python
print ("The DNA sequence's GC content is", GC_content, "%")
```

You can also format the output of a specific variable. For instance, if a `float`
has too many decimal points and you only want a certain number:

```python
print("The DNA sequence's GC content is %1.2f %%" % GC_content)
```
In the code above the first "%" creates a place holder, then the number before
the dot tells how many digits, the number after the dot tell how many decimal
points (both of these refer to the actual value of the number, i.e., "2" means
"I want two decimal points"!), and the "f" indicates the type of the format,
in this case a `float`. Then after the closing quotes comes a "%" indicating that the variable to be formatted is coming, followed by the actual variable. The two "%%" are needed to scape and print the actual "%" character.

Other formatting characters are:

`%d` for integers
`%3d` for integers with certain amount of numbers
`%s` for strings
`%e` for scientific/exponential notation

```python
print("%d" % 145.645467) # drops the decimals and rounds down.

print("%3d" % 43) # Add a blank space to the left because I told it 3 numbers
print("%s" % dna)
print("%e" % 10.6)

```


## Quiz

```python
dna = "gcatggcatcgcagcatgcgcatacgatcagaatgcgacagtcgcgcatcgatgcgcatacgactac"

o1 = dna.find('atg')
dna.find('atg',o1+1)

dna.rfind('atg')


dna.find('atg',dna.find('atg')+1)
```

```python

a=1

b=2

c=a+b

a = b

a = c

d=a+c

print(a, b, c, d)
```

# Week 2

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

### If Statements

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
    print("There are %d undefined bases" %nbases)

```

The conditions in the `if` statement are `Boolean expression`, meaning they can
be `True` or `False`. This expression are formed by comparison, identity, or membership.

### Comparison Operators

* Equal `==`
* Not equal `!=`
* Less than `<`
* Greater than `>`
* Less or equal than `<=`
* Greater or equal than `>=`

### Membership Operators

* `in` -> It returns `True` if something (variable, string, motif) is found in 
something else.
* `not in` -> The opposite of `in`

### Identity Operators

* `is` -> It returns `True` if both variables on wither side of the operator point to
 to the same object. This is different than `==`
* `is not` The opposite of `is`

```python
alphabet=["a", "c", "g", "t"]
newalphabet = alphabet[:] # makes a copy
newalphabet == alphabet # equal? True

newalphabet is alphabet # is? False!

# This is because newalphabet is a completely different object with a different 
# location in the memory.
```

When the `if` condition is not met, then the alternative code can be executed. 
We use the operator `else` and the alternative code.

```python
dna = input("Enter DNA sequence: ")

if "n" in dna:
    nbases = dna.count("n")
    print("There are %d undefined bases" %nbases)
else:
    print("DNA sequence has no undefined bases")

```

You can also test multiple alternative conditions in a single `if` statement. Do 
this with the `elif` statement. After all the alternative conditions have been 
tested, you can end the `if` statement with `else`.

```python
dna = input("Enter DNA sequence: ")

if "n" in dna:
    print("There are undefined bases")
elif "N" in dna: # in case the user enters uppercase letters
    print("There are undefined bases")
else:
    print("DNA sequence has no undefined bases")

```

### Logical Operators
These operators can combine statements.
* `and` -> Returns `True` if both conditions are true
* `or` -> Returns `True` if at least one condition is true
* `not` -> Returns `True` if the condition is false

```python
dna = input("Enter DNA sequence: ")

if "n" in dna or "N" in dna:
    nbases = dna.count("n") + dna.count("N")
    print("There are %d undefined bases" %nbases)
else:
    print("DNA sequence has no undefined bases")

```

## Ifs and Loops: part 2

### Loops

There are two kinds of loops, the `while` and `for` loops.

#### While Loops

Only execute the condition `while` it's true. Follows indentation similar to `if` 
statements.

#### For Loops

It iterates over the items in the order they appear. You can also iterate over a 
range of numbers, e.g., 1 through 5. You can do this easily with the function `range`

```python
for i in range(4):
    print(i)
# given a start, an end, and how often. Doesn't include the end!
for i in range(1, 10, 2):
    print(i)
    
dna = "acgatgcKactcagcBatacgUacag"

for i in range(len(dna)):
    if dna[i] not in "acgt":
        print("This is not a valid DNA sequence")
        print("The character %s in position %d, is not a valid DNA character" %(dna[i], i))

```
#### Break

You can stop a `for` loops if the condition is not met using the `break` statements.
This will stop as soon as the condition is not met _even_ if there are more.

```python
dna = "acgatgcKactcagcBatacgUacag"

for i in range(len(dna)):
    if dna[i] not in "acgt":
        print("This is not a valid DNA sequence")
        break

```

#### Continue

This statement causes the program to continue with the next iteration skipping the 
rest of the code in the loop. In the example below, we will read an incorrect sequence 
and delete the invalid DNA characters.

```python
dna = "acgatgcKactcagcBatacgUacag"
correct_dna = ""

for i in range(len(dna)):
    if dna[i] not in "acgt":
        continue
    correct_dna = correct_dna + dna[i]

print("Incorrect DNA sequence:\n%s" %dna)
print("Correct DNA sequence\n%s" %correct_dna)

```

If your code is complicated and is testing multiple nested `if` statements, using 
`continue` might improve the readability of your code.

```python
# This can be very messy!
for i in range(n):
    if condition1:
        function1(i)
        if condition2:
            function2(i)
            if condition3:
                function3(i)
                ....

# This is better
for i in range(n):
    if not condition1:
        continue
    function1(i)
    if not condition2:
        continue
    function2(i)
    if not condition3:
        continue
    function3(i)
```

#### Else Clause

Ususally, `else` clauses are part of `if` statements but python allows them in 
`for` and `while` loops.
The `else` is executed when the iterations are over in a `for` loop and when the 
condition is not true in a `while` loop. The `else` is **not** executed is the 
loop is terminated with a `break` statement. So if you are not using a `break`
statement, there is no need to use an `else`.

#### Pass Statement

This is a placeholder and does nothing. It is used when a statement is required
syntactically but you don't want anything to be executed. This can be useful when 
you are not sure of the a certain block of code but you need for the rest to 
execute.

```python
if motif not in dna:
    pass
else:
    some_function(motif, dna)

```

# Week 3

# Functions Part 1

General syntax:

```python
def function_name(arguments):
    """
    string documenting the function, called docstrings
    """
    
    function_code_block
    
    return output

```

Let's write a function to compute the GC percentage of a DNA string

```python

def GC_content(dna):
    
    """
    (str) -> int
    Returns the GC content percentage of a DNA string
    >>>gc("aaaaaaaagC")
    >>>20.0
    """
    dna = dna.upper()
    C = dna.count("C")
    G = dna.count("G")
    nbases = dna.count("N") # to account for unknown bases and remove them
    GC_percent = ((C + G) / (len(dna) - nbases)) * 100
    return GC_percent

GC_content("NnnnnnnnnC")
GC_content("atatatatGg")

```

## Scope of Variables declaration

Variables can either have a local or a global scope, meaning their are available
only within a function or also outside of them. A global variable is defined in
the main body of the source code outside of all functions, whereas a local
variable is defined within the function code block.

## Boolean functions

These are functions that return `True` or `False` values. They are useful in 
conditional statements like `if` or `while`.

Write a function that checks if a given DNA sequence contains in-frame stop codons.

```python

def stop_codon(dna):
    """
    This function checks if a string of DNA has an in-frame stop codon
    """
    stop_codon_found = False
    stop_codons = ("TAG", "TAA", "TGA")
    for i in range(0, len(dna), 3):
        codon = dna[i:i+3].upper() # Starts at zero and slices until (but not included) position 3. Upper in case the sequence is in lower
        if codon in stop_codons:
            stop_codon_found = True
            print("DNA sequence has an internal stop codon starting in position %d" %(i + 1))
            break


dna = "acgTAGttgcagcatcgactacgcatgcatcga"

stop_codon(dna)

```

Now, assume the function accepts a frame argument (0, 1, 2) to look for what frame
to look for the codons. Simply add the argument in the `def` line and use that 
variable in the code block

```python

def stop_codon(dna, frame):
    """
    This function checks if a string of DNA has an in-frame stop codon
    """
    stop_codon_found = False
    stop_codons = ("TAG", "TAA", "TGA")
    for i in range(frame, len(dna), 3):
        codon = dna[i:i+3].upper() # Starts at zero and slices until (but not included) position 3. Upper in case the sequence is in lower
        if codon in stop_codons:
            stop_codon_found = True
            print("DNA sequence has an internal stop codon starting in position %d" %(i + 1))
            break

```

Finally, we want to specify a default for the frame so that the function Starts
at position zero is the argument `frame` is not specified.
You can pass arguments in two ways, either by position or by name.

```python

def stop_codon(dna, frame=0):
    """
    This function checks if a string of DNA has an in-frame stop codon
    """
    stop_codon_found = False
    stop_codons = ("TAG", "TAA", "TGA")
    for i in range(frame, len(dna), 3):
        codon = dna[i:i+3].upper() # Starts at zero and slices until (but not included) position 3. Upper in case the sequence is in lower
        if codon in stop_codons:
            stop_codon_found = True
            print("DNA sequence has an internal stop codon starting in position %d" %(i + 1))
            break

```

Let's make a function to read a DNA sequence and returns the reverse complement.

You first need to reverse the string and this can be done with slicing. There is
and extended argument for how often you want to slice, the step argument. If you say `seq[0:3:2]`, this will return the 0 and 2 index only. Python knows that if
you say `seq[::-1]`, you want the whole string, `seq[:]`, but going backwards.

```python
def reverse_string(seq):
    return seq[::-1]

```

## List Comprehensions

To produce the complement sequence, we are going to use list comprehension. In 
Python, they provide a concise way to create lists. A common application is to
create new lists where each element is the result of some operation applied to 
each member of of another sequence, or to create subsequence of those elements 
that satisfy a certain condition.

The syntax is:

`new_list = [operation(i) for i in old_list if filter(i)]`

This last statement is equivalent to doing the following:

```python
new_list = []
for i in old_list:
    if filter(i):
        new_list.append(operation(i))
```

To use list comprehension in the function we do:

```python
def complement(dna):
    """
    Returns the reverse of the dna string
    """
    # Build a dictionary
    
    basecomplement = {"A" : "T", "C" : "G", "G" : "C", "T" : "A", "N" : "N",
     "a" : "t", "c" : "g", "g" : "c", "t" : "a", "n" : "n"}
    letters = list(dna) # converts the string into a list
    
    letters = [basecomplement[base] for base in letters] # this performs the operation `basecomplement` on each item (`base`) of the list `letters`
    
    return "".join(letters) #joins the items of the list `letters` using the method `join` that is available for strings. The separator is empty so the letters will be together.

#dna = "AAATTT"

```

Now we can use both functions together in a new function to return the reverse
complement of a sequence

```python

def reverse_complement(seq):
    """
    Returns the reverse complement of the dna string
    """
    seq = reverse_string(seq)
    seq = complement(seq)
    return seq


dna = "AAAATTTTGGGGCCCC"

reverse_complement(dna)

```

## Split and Join 

`Split` and `join` are methods of the string object. The method `split()` returns
 a list with all the words in the string. The default separator is withe space but
 this can be changed to anything else.
 
```python
sentence = "enzymes and proteins come in many shapes"

#separate using white space
sentence.split()
splitted_list = sentence.split()

# separate using something else, which goes away after splitting
sentence.split("and")

```

The method `join()` is the opposite, it creates a string with every item from a list.
You need to specify a separator.

```python
"-".join(["enzymes", "and", "proteins", "come", "in", "many", "shapes"])

"-".join(splitted_list)

```

## Variable Number of Function arguments

A typical function has a specific number of arguments, e.g., `def myfunction(first, second, third):`,
but you can also allow for a variable number with this syntax:

```python
def newfunction(first, second, third, *therest):
    print("First: %s" %first)
    print("Second: %s" %second)
    print("Third: %s" %third)
    print("And all the rest...", therest)
    return

newfunction(1, 2, 3, 4, 5)

```

# Defining Modules and Packages

## Modules

Modules are python files that contain definitions of functions or variables, usually
related to a specific theme. 
Grouping related code into a module makes the code easier to understand, share, and use.

A module usually has the following structure:

```python
/usr/bin/python

"""
Short description of the module
"""

def function1(x):
    
def function2(x):
    
etc

```

After the module has been created, it can be used in a new environment with 
`import name_of_module`. Notice that the `.py` extension is omitted. When a module
is imported, Python first searches for built-in modules, then it will search for
a file with that name. Python searches for that file file fist in the current 
directory, then in the directory Python has been installed, and then in the path
stored in the variable `PYTHONPATH`. You can use the `sys.path` variable to see
where Python looks for modules.

```python
import sys

sys.path

```

You can append directories to the path by doing

```python
sys.path.append("path/to/new/directory")

```

After a module has been imported, the functions within it can be called with: 
`module_name.function_name()`. Alternatively, we can import the names that a module
defines with: `from module_name import *`, or import only a few of its functions
with: `from module_name import function_name1, function_name2`.

Importing the module and having to write the name of it in front of the function 
can be useful if the same function is available in multiple modules and one wants
to be certain that one is using the one from a specific module.

## Packages

Packages are a collection of modules. The only requirement is that the directory 
must have a file called `__init__.py` that indicate to Python that the directory
is a package. The file `__init__.py` can be empty. A package can be imported the
same way a module is.

An example of a package could be a collection of modules to process DNA, RNA, and
proteins sequences. These modules would go in a directory called `bioseq` along with 
the `__init__.py` file. There could be subdirectories packages within `bioseq`, 
say `fasta` and `fastq`, and each of those would also have an `__init__.py` file.

To load a module within a package, we can do two things:

`import package_name.module_name`, which results in functions having a long name, 
i.e., `package_name.module_name.function_name`, or import the module from the 
package with: `from package_name import module_name`, which shortens the name of
the function to just `module_name.function_name`.

Finally, to import a specific function from a submodule in a subpackage you can 
do: `from package_name.module_name import function_name`. This results in the 
function only having its name and nothing else.

All these way to import packages, modules, and functions are very useful when working
with well established packages like BioPython.
# Communicating with the Outside: Reading and Writing Files

To open a file, we use the built-in function `open(filename, mode)`
The mode parameter tells python what to do with the files we are opening, we can
read it `"r"` (default), write to it `"w"`, or append `"a"`. if a file already 
exists, writing will overwrite.

The result of the `open` function is a file object **and not** the file itself

```python
f = open("myfile", "r") # This will open a file and be ready to read from it

f = open("myfile", "w") # This will open a file and be ready to write to it

f = open("myfile", "a") # This will open a file and be ready to append to it

```

If you attempt to open a file that doesn't exists, Python will give you an error. 
A common way to deal with this is to tell Python what to do if there is an error.
his can be done with the function `try`.

```python
try:
    f = open("myfile")
except IOError:
    print("The file does not exists.")

```

Once the file is opened, now we can read it. There are multiple ways to do this, 
one of them is to use a `for` loop that will iterate over each line of the file:

```python
for line in f:
    print(line)
```

Another way is to use the `.read` method of the file object. This method reads the 
_entire_ file and not one line at a time, it also includes newline (`\n`) characters.

```python
f.read()

```

The last way to read a file is to use the `.readline` method, which returns only
one line at a time.

```python

f.readline()

```

Importantly, if you have already read a file and read it again, you will receive 
an empty line. This is because you are at the end of the file! To fix this, we can
use the `seek` method:


```python

f.seek(0) # Go to the beginning of the file
f.readline() # Read the file again

```

Similarly, we can write to a file using the `.write` method. This will write to 
a file and return the number of characters written in Python3 or `None` in Python2.

```python
f.write(variable)

```

Finally, after you are done with a file you can close it with the `.close` method 
with no arguments. This will free any system resources taken up by the opened file.
If one doesn't close a file, it will be closed at the end of the program but it's
good practice to close files.

```python
f.close()
```

## Using Read, Write, and Append

In this exercise, we are going to build a dictionary containing all the sequences
from a FASTA file.

```python
try:
    f = open("ITS.fasta", "r")
except IOError:
    print("File doesn't exist!")

seqs = {}

for line in f:
    line = line.rstrip() # removes any empty lines at the end of file
    #if line[0] == ">": #Identifies the header of a fasta sequence
    # The line above should work but it doesn't!!
    if line.startswith(">"): # This can be used too
        words = line.split() # Split the header on white space, if there is more info than the name
        name = words[0][1:] # Assign the first item of that list we split to variable `name`, 
        # and slices the first character (">") from the name.
        # I think `name` needs `""` in the line below
        seqs[name] = "" # Creates a new, empty entry in the dictionary 
    else: # not on the header but on a sequence line
        seqs[name] = seqs[name] + line

for name, seq in seqs.items():
    print(name, seq)

f.close()

```

## Retrieving Data from Dictionaries

We can retrieve the key and corresponding value from a dictionary using the 
`.items` method.


```python
for name,seq in seqs.items():
    print(name, seq)

```

## Processing Command Line Arguments

Scripts usually need to process command line arguments. If we had a script to 
process a fasta file called `process_fasta.py` and you want to run it on a file 
specified on the command line:

```python
python process_fasta.py myfile.fasta

```

The arguments of the above command are stored in the `sys` module's `argv` attribute
as a list, with the actual script in index 0 `[0]`, and the first argument in index 1 `[1]`. See the script `processfasta.py` for an example of a script you can give
to Python.

```python
import sys
print(sys.argv)

```

If you want more flexibility with the arguments, you can use the module `getopt` 
that lets you process arguments in `sys.argv` with mmore options.
For example, say you only want to process sequences that are >250bp, and you
would like to call the program with `processfasta.py -l 250 myfile.fa.`

First, it is a good idea to define a `usage()` function to give an explanation of
what the script does, i.e., a help page. Optional arguments are indicated by
square brackets.

```python

def usage():
    print """
    processfasta.py reads a FASTA file and builds a dictionary with all the sequences in it. You can give an optional length to keep.
        
    processfasta.py [-h] [-l <length] <filename>
    
    -h                  print this message
    
    -l <length>         filter all sequences with a length smaller than <length>
                        (default <length> = 0)
                        
    <filename>          File to process, must be in fasta format
    
    """
    
```

You then need to create a dictionary with the optional and required arguments for 
your script. This is done with the method `getopt` of the `getopt` module. If you
have a colon after an argument (e.g., `l:`) that means that that argument needs
to have a value, e.g., 250bp.

```python
import getopt

# o is optional, a is required
o, a = getopt.getopt(sys.argv[1:], "l:h")
opts = {}
seqlen = 0

for k, v in o:
    opts[k] = v # the entry k in the dictionary gets the value v

if "-h" in opts.keys(): #if the user types "h", runs function `usage` and exit
    usage()
    sys.exit()

if len(a) < 1: # if the required arguments are missing (only one in this case)
    usage(); sys.exit("Input fasta file is missing") #give help and exit with message
if "-l" in opts.keys():
    if int(opts["l"]) < 0: # check if length is has a positive value
        print("Length of sequence should be positive!")
        sys.exit()
    else: # if the value is positive, assign it to "-l"
        seqlen = opts["-l"]
```

# Unix Environment

Anytime we run a script, there are various streams recognized by any computer:
* A common one is standard input or `stdin`, which is a stream of data that goes into a program. Unless it's redirected, `stdin` is expected to be typed on the command line or piped from a different program.
* Standard output or `stdout` is the stream of data that the program writes. Unless it's redirected, it will be printed to the screen
* Standard error or `stderr` usually outputs errors or diagnostics. It is independent from `stdout` and can provide information even if `stdout` is redirected. This stream can be redirected too.

Redirection can be easily done with:

```
my_program | my_script.sh 1>program_output.txt 2>error_message.txt

```

You can use the `sys` module to access and handle these streams of data, i.e., 
`stdin`, `stdout`, and `stderr`. If reading from `stdin` you need to enter `ctrl-d`
to exit. The `.write` method of `sys.stdout` writes to a file and outputs how 
many characters were written. Finally, you can also write a message to the `stderr`
and it will also provide the length of the string

```python
# you are able to type in the stdin with the read method of sys.stdin
sys.stdin.read()
something #typed
other thing #typed
'something\nother thing' #result

# using the .write method of sys.stdout
sys.stdout.write("Some useful output.\n")

# writing to stderr
sys.stderr.write("Warning, no file\n")

```

## Interacting (Interfacing) with other programs from Python

To call programs available on your computer, e.g., some genomic program, on many
files, you can write a python program to read all the files and call it on all of 
them. You do this with the `call` function in the `subprocess` module. You can
specify the program you want to run, as a string, and then the arguments for that
program as a separate string.

```python
import subprocess

subprocess.call(["ls", "-l"])

# This would call the program "tophat" with three arguments
subprocess.call(["tophat", "genome_index", "PE_reads_1.fq.gz", "PE_reads_2.fq.gz"])

```

# Biopython

Contains many tools for bioinformatics. It provides many modules and scripts to 
deal with many genomic data and bioinformatic problems.

Here is an example you can easily solve with Biopython, find out the origin of
and unknown DNA sequence. The default output is in XML format, so we are going 
to import the `NCBIXML` module too.

```python
from Bio.Blast import NCBIWWW
fasta_string = open("seq.fasta").read()
result_handle = NCBIWWW.qblast("blastn", "nt", fasta_string)

help(NCBIWWW.qblast)

from Bio.Blast import NCBIXML
blast_record = NCBIXML.read(result_handle)

# Some of the results from a blastn search

len(blast_record.alignments)

# Sort those alignments based on the "E" value, the smaller the better because
# there is a smaller chance that the result is based on chance.
# Do this by iterating over all alignments in a `for` loop

E_VALUE_THRESHOLD = 0.01

for alignemnt in blast_record.alignments:
    for hps in alignemnt.hsps:
        if hsp.expect < E_VALUE_THRESHOLD:
            print("**** Alignment ****")
            print("Sequence:", alignemnt.title)
            print("Length:"), alignemnt.length)
            print("e value", hps.expect)
            print(hsp.query)
            print(hsp.match)
            print(hsp.sbjct)

```
