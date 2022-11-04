#!/bin/python3
# This script takes sequence coordinates in the format "first:last"
# and returns intron and exon files

# Setting variables from files
with open("remotefullseq.txt") as file:
    remote_seq = file.read()

with open("localfullseq.txt") as file:
    local_seq = file.read()

with open("coordinates_remote.txt") as file:
    coords = file.read()


coord1 = int(coords[:2])
coord2 = int(coords[3:])

remote_seq = remote_seq.replace("\n", "")
local_seq = local_seq.replace("\n", "")

remote_intron_1 = remote_seq[:coord1-1]
exon_remote = remote_seq[coord1-1:coord2]
remote_intron_2 = remote_seq[coord2:]

local_exon_1 = local_seq[:63]
local_intron = local_seq[63:90]
local_exon_2 = local_seq[91:]

remote_introns = remote_intron_1 + remote_intron_2
local_exons = local_exon_1 + local_exon_2

with open("local_int.fa", "w") as file:
    file.write(">local sequence introns " + str(len(local_intron)) + "\n" + local_intron)

with open("local_ex.fa", "w") as file:
    file.write(">local sequence exons " + str(len(local_exons)) + "\n" + local_exons)

with open("remote_ex.fa", "w") as file:
    file.write(">AJ223353.1 exons " + str(len(exon_remote)) + "\n" + exon_remote)

with open("remote_int.fa", "w") as file:
    file.write(">AJ223353.1 introns " + str(len(remote_introns)) + "\n" + remote_introns)
