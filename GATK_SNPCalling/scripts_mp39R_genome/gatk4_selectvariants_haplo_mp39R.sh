#!/bin/bash
 
#SBATCH --job-name=SelectVariants_gatk4
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --mem=12GB
#SBATCH --time=24:00:00
#SBATCH --output=%x-%j.SLURMout

cd ${SLURM_SUBMIT_DIR}


gatk SelectVariants \
-R ../mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked.fasta \
-V Mp39R_95excM1431_dedup_haplo.vcf.gz \
--select-type-to-include SNP \
-O Mp39R_95excM1431_dedup_haplo.SNP.vcf.gz \

