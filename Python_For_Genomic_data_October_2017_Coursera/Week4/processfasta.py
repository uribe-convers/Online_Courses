#!/usr/bin/python

"""
this scrip will build a dictionary with all sequences in a FASTA file.
"""

import sys
import getopt

def usage():
    print("""
    processfasta.py reads a FASTA file and builds a dictionary with all the sequences in it. You can give an optional length to keep.
        
    processfasta.py [-h] [-l <length] <filename>
    
    -h                  print this message
    
    -l <length>         filter all sequences with a length smaller than <length>
                        (default <length> = 0)
                        
    <filename>          File to process, must be in fasta format""")


# Processing arguments
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
    if int(opts["-l"]) < 0: # check if length is has a positive value
        print("Length of sequence should be positive!")
        sys.exit()
    else: # if the value is positive, assign it to "-l"
        seqlen = opts["-l"]


filename = sys.argv[1] # takes the fisrt argument from the command line

# Tries to open the file
try:
    f = open(filename, "r")
except IOError:
    print("File %s doesn't exist!" %filename)

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
