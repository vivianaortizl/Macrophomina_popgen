#!/bin/sh -login

#PBS -l walltime=02:00:00,nodes=1:ppn=1,mem=3gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mapping_bwa/out_sort_bam/standard_out.$PBS_ARRAYID.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mapping_bwa/out_sort_bam/standard_error.$PBS_ARRAYID.txt
#PBS -N sort_bam_mp39R
#PBS -t 1-96

cd ${PBS_O_WORKDIR}

module load SAMTools 

line=$(sed -n -e "$PBS_ARRAYID p" mp_readnames.txt)
echo " line: $line"
samtools sort -T /tmp/${line}_masked.sorted -o ${line}_masked.sorted.bam ${line}_masked.bam

