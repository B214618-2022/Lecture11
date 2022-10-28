#!/usr/bin/python3
#Written by B214618-2022 on 25/10/2022
#-----------------------------------------

my_dna = "ACTGATCGATTACGTATAGTAGAATTCTATCATACATATATATCGATGCGTTCAT"
restriction_site = "GAATTC"
dna_length = len(my_dna)
cut_position = my_dna.find("GAATTC") + 1
print(str(dna_length - cut_position), str(cut_position))
