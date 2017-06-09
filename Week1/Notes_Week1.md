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

Concatenate = +
Replicate = *
Present in string = in
*Not* present in string = not in

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
program by imporating it as a module with: `import filename` without the extension.
The file needs to be in the same directory.
