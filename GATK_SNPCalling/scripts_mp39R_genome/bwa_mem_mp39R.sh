#!/bin/sh -login

#PBS -l walltime=04:00:00,nodes=4:ppn=1,mem=12gb
#PBS -o /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mapping_bwa/out_bwa_mapping/standard_out.$PBS_ARRAYID.txt
#PBS -e /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mapping_bwa/out_bwa_mapping/standard_error.$PBS_ARRAYID.txt
#PBS -N bwa_mem_mp39R
#PBS -t 1-96


cd ${PBS_O_WORKDIR}

module load bwa
module load SAMTools 


line=$(sed -n -e "$PBS_ARRAYID p" mp_readnames.txt)
line2=$(sed -n -e "$((PBS_ARRAYID + 96)) p" mp_readnames.txt)
echo " line: $line ,    line2: $line2"
bwa mem -t 1 \
-R "@RG\tID:${line}\tSM:${line}\tPL:ILLUMINA\tLB:${line}\tPU:RTSF" \
-M \
/mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mp39R_reference/Macpha1_AssemblyScaffolds_Repeatmasked.fasta \
/mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/clean_reads/${line}.cutadapt.fastq.gz \
/mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/clean_reads/${line2}.cutadapt.fastq.gz \
| samtools view -S -b -o ${line}_masked.bam -

qstat -f $PBS_JOBID