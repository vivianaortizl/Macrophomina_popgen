#!/bin/sh -login
#PBS -l walltime=04:00:00,nodes=1:ppn=4,mem=8gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/variants_haplotypecaller/out.genotypegvcf/standard_out.genotypeGVCFs.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/variants_haplotypecaller/out.genotypegvcf/standard_error.genotypeGVCFs.txt
#PBS -N genotypeGVCFs_gatk4_mp39R

cd ${PBS_O_WORKDIR}

module load Java/1.8.0_31

GATK4=/mnt/home/ortizviv/08312017_mp_whgenome/software/gatk-4.0.4.0

${GATK4}/gatk --java-options "-Xmx10G" GenotypeGVCFs \
-R ../mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked.fasta \
-V Mp39R_96_dedup_haplo.g.vcf.gz \
-O Mp39R_96_dedup_haplo.vcf.gz \
-new-qual
