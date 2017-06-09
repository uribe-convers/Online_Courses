#!/usr/bin/python

dna = "cgatgcatgcacgctgcagtcgcagcatggta"

num_C = dna.count("c")
num_G = dna.count("g")

total_length_dna = len(dna)

GC_content = (num_C + num_G) * 100.0 / total_length_dna

print (GC_content)
