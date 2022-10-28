#!/bin/sh -login

#PBS -l walltime=01:00:00,nodes=1:ppn=1
#PBS -o standard_out.txt
#PBS -e standard_error.txt
#PBS -N index_genome_bowtie

#change to the working directory where the code is located
cd ${PBS_O_WORKDIR}

#module load
module load bowtie2/2.3.1

#index genome for bowtie2
bowtie2-build /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked.fasta /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked \

