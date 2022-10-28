#!/bin/sh -login

#PBS -l walltime=04:00:00,nodes=1:ppn=1,mem=3gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/dedup_bam_bwa/out.flag.dedup/standard_out.$PBS_ARRAYID.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/dedup_bam_bwa/out.flag.dedup/standard_error.$PBS_ARRAYID.txt
#PBS -N flagstat_dedup
#PBS -t 1-96

cd ${PBS_O_WORKDIR}

module load SAMTools 

line=$(sed -n -e "$PBS_ARRAYID p" mp_readnames.txt)
echo " line: $line"
samtools flagstat ${line}_dedup.bam \

