#!/bin/sh -login

#PBS -l walltime=06:00:00,nodes=1:ppn=2,mem=24gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/dedup_bam_bwa/out.dedup/standard_out.W12_6.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/dedup_bam_bwa/out.dedup/standard_error.W12_6.txt
#PBS -N markduplicates_mp39R_W12_6

cd ${PBS_O_WORKDIR}

module load picardTools/1.89 
module load Java/1.8.0_31

java -Xms12G -Xmx14G -jar $PICARD/MarkDuplicates.jar \
INPUT=../mapping_bwa/W12_6_R1_masked.sorted.bam \
OUTPUT=W12_6_R1_dedup.bam \
METRICS_FILE=W12_6_R1_metrics.txt