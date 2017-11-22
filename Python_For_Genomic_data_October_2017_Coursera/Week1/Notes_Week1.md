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
