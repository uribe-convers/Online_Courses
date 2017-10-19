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
