#!/bin/sh -login

#PBS -l walltime=04:00:00,nodes=1:ppn=2,mem=6gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/dedup_bam_bwa/out.validatesam/standard_out.$PBS_ARRAYID.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/dedup_bam_bwa/out.validatesam/standard_error.$PBS_ARRAYID.txt
#PBS -N ValidateSamFile
#PBS -t 1-96

cd ${PBS_O_WORKDIR}

module load picardTools/1.89 
module load Java/1.8.0_31

line=$(sed -n -e "$PBS_ARRAYID p" mp_readnames.txt)
echo " line: $line"

java -Xmx6G -jar $PICARD/ValidateSamFile.jar \
I=${line}_dedup.bam \
MODE=SUMMARY
