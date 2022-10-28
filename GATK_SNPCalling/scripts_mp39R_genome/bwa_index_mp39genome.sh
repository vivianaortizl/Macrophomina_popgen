#!/bin/sh -login

#PBS -l walltime=02:00:00,nodes=1:ppn=1,mem=3g

#change to working directory
cd ${PBS_O_WORKDIR}

#load bwa
module load bwa
bwa index Macpha1_AssemblyScaffolds_Repeatmasked.fasta
