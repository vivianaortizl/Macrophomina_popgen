#!/bin/bash
 
#SBATCH --job-name=SelectVariants_gatk4
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --mem=12GB
#SBATCH --time=3:00:00
#SBATCH --output=%x-%j.SLURMout

cd ${SLURM_SUBMIT_DIR}

module purge
module load ifort/2018.1.163-GCC-6.4.0-2.28  impi/2018.1.163 GATK/4.0.4.0-Python-3.6.4

gatk SelectVariants \
-R ../mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked.fasta \
-V Mp39R_95excM1431_dedup_haplo.SNP.filtergatk.vcf.gz \
--select-type-to-include SNP \
--exclude-filtered \
-O Mp39R_95excM1431_dedup_haplo.SNP.filt.excl.gatk.vcf.gz \

