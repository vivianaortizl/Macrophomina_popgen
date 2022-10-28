#!/bin/sh -login

#PBS -l walltime=01:00:00,nodes=1:ppn=2

cd ${PBS_O_WORKDIR}

module load picardTools/1.89
module load SAMTools/1.5 

java -jar $PICARD/CreateSequenceDictionary.jar REFERENCE=Macpha1_AssemblyScaffolds_Repeatmasked.fasta OUTPUT=Macpha1_AssemblyScaffolds_Repeatmasked.dict |
samtools faidx Macpha1_AssemblyScaffolds_Repeatmasked.fasta
