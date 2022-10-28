#!/bin/sh -login

#PBS -l walltime=04:00:00,nodes=1:ppn=1,mem=6gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mapping_bwa/out_bwa_mapping/standard_out.W12_6.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mapping_bwa/out_bwa_mapping/standard_error.W12_6.txt
#PBS -N bwa_mem_mp39R_W12_6



cd ${PBS_O_WORKDIR}

module load bwa
module load SAMTools 


bwa mem -t 1 \
-R "@RG\tID:W12_6_R1\tSM:W12_6_R1\tPL:ILLUMINA\tLB:W12_6_R1\tPU:RTSF" \
-M \
/mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked.fasta \
/mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/clean_reads/W12_6_R1.cutadapt.fastq.gz \
/mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/clean_reads/W12_6_R2.cutadapt.fastq.gz \
| samtools view -S -b -o W12_6_R1_masked.bam -

qstat -f $PBS_JOBID