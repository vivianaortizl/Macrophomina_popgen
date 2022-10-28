#!/bin/sh -login
#PBS -l walltime=20:00:00,nodes=1:ppn=4,mem=16gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/variants_haplotypecaller/out.haplogatk4.individual/standard_out.74.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/variants_haplotypecaller/out.haplogatk4.individual/standard_error.74.txt
#PBS -N hc_gatk4_CRRed3_mp39R


cd ${PBS_O_WORKDIR}

module load Java/1.8.0_31

GATK4=/mnt/home/ortizviv/08312017_mp_whgenome/software/gatk-4.0.4.0

${GATK4}/gatk --java-options "-Xmx10G" HaplotypeCaller \
-R ../mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked.fasta \
-I ../dedup_bam_bwa/CR_Red_3_R1_dedup.bam \
-O CR_Red_3_R1_Mp39R_dedup_haplo.g.vcf \
-ERC GVCF \
--standard-min-confidence-threshold-for-calling 30.0 \
--output-mode EMIT_VARIANTS_ONLY \
--sample-ploidy 1 \
--min-base-quality-score 15 \
--use-new-qual-calculator true