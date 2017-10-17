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
