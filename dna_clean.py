#!/bin/python3
# This script takes a text input and converts it to upper case, before extracting only nucleotide
# Symbols and writing to a new "clean_seq.txt" file.

# Setting variables, converting to upper case
dna_seq = open("genomic_seq_CDS.txt").read()
dna_seq = dna_seq.upper()
new_seq = ''

# Extracting nucleotide symbols
for x in str(dna_seq):
    if x == 'A':
         new_seq = new_seq + x
    elif x == 'T':
         new_seq = new_seq + x
    elif x == 'G':
         new_seq = new_seq + x
    elif x == 'C':
         new_seq = new_seq + x
    else:
         continue

# Writing new file
with open("clean_seq.txt", "w") as clean_seq:
    clean_seq.write(new_seq)

