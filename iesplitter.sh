#!/bin/bash
# This script takes fasta inputs and splits them into coding and non-coding sequence files with no headers

wget http://nematodes.org/teaching/bioinformatics/nem.fasta
makeblastdb -in nem.fasta -dbtype prot -out nem

# Setting variables
remotenuc=$(efetch -db nucleotide -id AJ223353 -format fasta | grep -v ">" | tr -d '\n')
localnuc=$(cat /localdisk/data/BPSM/Lecture11/plain_genomic_seq.txt)

coord1=$(efetch -db nucleotide -id AJ223353 -format gb | grep CDS | awk '{print $2}' | cut --delimiter="." -f1)
coord2=$(efetch -db nucleotide -id AJ223353 -format gb | grep CDS | awk '{print $2}' | cut --delimiter="." -f3)

printf $coord1 > coordinates_remote.txt
printf ':' >> coordinates_remote.txt
printf $coord2 >> coordinates_remote.txt

# Saving a file and then cleaning it up with a python script
echo $localnuc > seqdata.txt
./dna_clean.py
rm seqdata.txt

echo $remotenuc > remotefullseq.txt

python3 intronexon.py

blastx -db nem -query remote_ex.fa -outfmt 7 | grep -v "^#" | sort --field-separator=$'\t' -g -k 11 | column -t > remote.out
blastx -db nem -query local_ex.fa -outfmt 7 | grep -v "^#" | sort --field-separator=$'\t' -g -k 11 | column -t > local.out


echo -e "\n highest scoring remote sequence: \n"
head -1 remote.out
echo -e "\n highest scoring local sequence: \n"
head -1 local.out
echo -e "\n"

rm nem*
rm *.txt
rm *.fa
rm *.out
