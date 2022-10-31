#!/bin/bash
# This script takes fasta inputs and splits them into coding and non-coding sequence files with no headers

# Setting variables
localnuc=$(efetch -db nucleotide -id AJ223353 -format fasta | grep -v ">" | tr -d '\n')
remotenuc=$(cat /localdisk/data/BPSM/Lecture11/plain_genomic_seq.txt)

# Saving a file and then cleaning it up with a python script
echo $remotenuc > seqdata.txt
./dna_clean.py
remotenuc=$(cat clean_seq.txt)
rm clean_seq.txt
rm seqdata.txt

echo $localnuc
echo $remotenuc
