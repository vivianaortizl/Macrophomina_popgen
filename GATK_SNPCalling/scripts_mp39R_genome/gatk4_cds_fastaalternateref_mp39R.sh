#!/bin/bash
 
#SBATCH --job-name=cds_FastaAltRef_gatk4
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --mem=12GB
#SBATCH --time=48:00:00
#SBATCH --output=%x-%j.SLURMout

cd ${SLURM_SUBMIT_DIR}

module purge
module load GCC/7.3.0-2.30  OpenMPI/3.1.1 GATK/4.1.4.1-Python-3.6.6

gatk FastaAlternateReferenceMaker \
-R /mnt/home/ortizviv/08312017_mp_whgenome/ortho_mp/mpcds/Macpha1_GeneCatalog_CDS_20180322.fasta \ 
-V /mnt/home/ortizviv/08312017_mp_whgenome/ortho_mp/081121_mp39_95_vcf/051920_mp39_95_SNP_DPquant595_DP4_0miss_MQ60_MAF002.vcf.gz \
-O ./mp95_fasta_altref/cds_altref_Mp39R_95.fasta \