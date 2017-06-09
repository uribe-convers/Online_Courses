# Python and Genomic Data

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
