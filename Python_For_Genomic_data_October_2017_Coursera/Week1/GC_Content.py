#!/usr/bin/python

"""
This program computes the GC content of a DNA sequence.
"""

dna = "cgatgcatgcacgctgcagtcgcagcatggta"

num_C = dna.count("c")  # Count "c" in dna
num_G = dna.count("g")  # Count "g" in dna

total_length_dna = len(dna)

GC_content = (num_C + num_G) * 100.0 / total_length_dna

print (GC_content)
