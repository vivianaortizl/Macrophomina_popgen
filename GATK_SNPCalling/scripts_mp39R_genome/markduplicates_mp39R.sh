#!/bin/sh -login

#PBS -l walltime=06:00:00,nodes=1:ppn=3,mem=24gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/dedup_bam_bwa/out.dedup/standard_out.$PBS_ARRAYID.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/dedup_bam_bwa/out.dedup/standard_error.$PBS_ARRAYID.txt
#PBS -N markduplicates_mp39R
#PBS -t 1-96

cd ${PBS_O_WORKDIR}

module load picardTools/1.89 
module load Java/1.8.0_31

line=$(sed -n -e "$PBS_ARRAYID p" mp_readnames.txt)
echo " line: $line"

java -Xms12G -Xmx14G -jar $PICARD/MarkDuplicates.jar \
INPUT=../mapping_bwa/${line}_masked.sorted.bam \
OUTPUT=${line}_dedup.bam \
METRICS_FILE=${line}_metrics.txt