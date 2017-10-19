def get_length(dna):
    """ (str) -> int

    Return the length of the DNA sequence dna.

    >>> get_length('ATCGAT')
    6
    >>> get_length('ATCG')
    4
    """
    return len(dna)


def is_longer(dna1, dna2):
    """ (str, str) -> bool

    Return True if and only if DNA sequence dna1 is longer than DNA sequence
    dna2.

    >>> is_longer('ATCG', 'AT')
    True
    >>> is_longer('ATCG', 'ATCGGA')
    False
    """
    return len(dna1) > len(dna2)


def count_nucleotides(dna, nucleotide):
    """ (str, str) -> int
    Return the number of occurrences of nucleotide in the DNA sequence dna.
    >>> count_nucleotides('ATCGGC', 'G')
    2
    >>> count_nucleotides('ATCTA', 'G')
    0
    """
    num_nucleotide = 0
    for i in dna:
        if i in nucleotide:
            num_nucleotide = num_nucleotide + 1
    return num_nucleotide


def contains_sequence(dna1, dna2):
    """ (str, str) -> bool

    Return True if and only if DNA sequence dna2 occurs in the DNA sequence
    dna1.

    >>> contains_sequence('ATCGGC', 'GG')
    True
    >>> contains_sequence('ATCGGC', 'GT')
    False

    """
    return dna2 in dna1


def is_valid_sequence(dna):
    """(str) -> bool

    Returns True is the string dna contains valid nucleotides (AGTC).
    Only capital letters are valid for nucleotides.

    >>>is_valid_sequence("AGTCGTA")
    True
    >>>is_valid_sequence("AGTYKA")
    Flase
    >>>is_valid_sequence("agtcg")
    False
    """
    valid_nucleotides = True

    for i in dna:
        if i not in "AGTC":
            valid_nucleotides = False
    return valid_nucleotides


def insert_sequence(dna1, dna2, index):
    """
    (str, str, int) -> str

    Returns a string where dna2 is inserted into dna1 at a specific location
    given by an index. Only capital letters are valid for nucleotides.

    >>>insert_sequences("CCGC", "AT", 2)
    CCATGC
    >>>insert_sequences("ACACACA", "TTT", 7)
    ACACACATTT
    """
    return dna1[:index] + dna2 + dna1[index:]


def get_complement(nucleotide):
    """
    (str) -> str

    Returns the complementary base from a given nucleotide.
    Only capital letters are valid for nucleotides.

    >>>get_complement("A")
    'T'
    >>>get_complement("G")
    'C'
    """
    final_nucleotide = ""

    if nucleotide == "A":
        final_nucleotide = "T"
    elif nucleotide == "T":
        final_nucleotide = "A"
    elif nucleotide == "G":
        final_nucleotide = "C"
    elif nucleotide == "C":
        final_nucleotide = "G"
    return final_nucleotide


def get_complementary_sequence(dna):
    """
    (str) -> str

    Returns the complementary sequence for a dna sequence.
    Only capital letters are valid for nucleotides.

    >>>get_complementary_sequence("AAGG")
    'TTCC'
    >>>get_complementary_sequence("GGTTCCAA")
    'CCAAGGTT'
    """
    new_dna = ""
    for i in dna:
        if i == "A":
            new_dna = new_dna + "T"
        elif i == "T":
            new_dna = new_dna + "A"
        elif i == "G":
            new_dna = new_dna + "C"
        elif i == "C":
            new_dna = new_dna + "G"
    return new_dna
