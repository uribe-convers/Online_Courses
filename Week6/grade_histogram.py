import tkinter.filedialog

# Gives user the option of selecting a file
a1_filename = tkinter.filedialog.askopenfilename()

# Reads the file
a1_file = open(a1_filename, "r")

for line in a1_file:
    print(line)


# Read the grades into a file

# Count the grades per range

# Write the histogram to the file

"""
0-9:    *
10-19:  **
20-29:  ****
  :
90-99:  **
100:    *
"""
