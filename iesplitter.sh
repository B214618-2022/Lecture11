#!/bin/bash
# This script takes fasta inputs and splits them into coding and non-coding sequence files with no headers

# Setting variables
remotenuc=$(efetch -db nucleotide -id AJ223353 -format fasta | grep -v ">" | tr -d '\n')
localnuc=$(cat /localdisk/data/BPSM/Lecture11/plain_genomic_seq.txt)

# Saving a file and then cleaning it up with a python script
echo $localnuc > seqdata.txt
./dna_clean.py
rm seqdata.txt

echo $remotenuc > remotefullseq.txt
