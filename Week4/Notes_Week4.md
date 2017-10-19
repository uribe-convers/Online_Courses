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

# BioPython
