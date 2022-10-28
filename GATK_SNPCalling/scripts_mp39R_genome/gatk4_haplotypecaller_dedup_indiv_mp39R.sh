#!/bin/sh -login
#PBS -l walltime=12:00:00,nodes=4:ppn=4,mem=16gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/variants_haplotypecaller/out.haplogatk4.individual/standard_out.$PBS_ARRAYID.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/variants_haplotypecaller/out.haplogatk4.individual/standard_error.$PBS_ARRAYID.txt
#PBS -N hc_gatk4_individual_mp39R
#PBS -t 1-96

cd ${PBS_O_WORKDIR}

module load Java/1.8.0_31

line=$(sed -n -e "$PBS_ARRAYID p" mp_readnames.txt)
echo " line: $line"

GATK4=/mnt/home/ortizviv/08312017_mp_whgenome/software/gatk-4.0.4.0

${GATK4}/gatk --java-options "-Xmx10G" HaplotypeCaller \
-R ../mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked.fasta \
-I ../dedup_bam_bwa/${line}_dedup.bam \
-O ${line}_Mp39R_dedup_haplo.g.vcf \
-ERC GVCF \
--standard-min-confidence-threshold-for-calling 30.0 \
--output-mode EMIT_VARIANTS_ONLY \
--sample-ploidy 1 \
--min-base-quality-score 15 \
--use-new-qual-calculator true