def read_grades(gradefile):
    """(file open for reading) -> list of float
    Read and return the list of grades in the gradefiles

    Precondition: gradefile starts with a header that contains no blank lines,
    then has a blank line, and then lines containing a student number and grade.
    """
    # Skip the header
    line = gradefile.readline()
    while line != "\n":
        line = gradefile.readline()
    # Read the grades, accumulating them into a list
    # Create accumulator
    grades = []
    line = gradefile.readline()
    while line != "":
        # We have a string comtaining information for a single student
        # Find the last space and take everything after that space
        grade = line[line.rfind(" ") + 1:]
        line = gradefile.readline()
