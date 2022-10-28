#!/bin/bash --login
#SBATCH --time=48:00:00 	# limit of wall clock times
#SBATCH --ntasks=20		# how many tasks (nodes)
#SBATCH --cpus-per-task=2	# number of CPUs (or cores) per task
#SBATCH --mem=80G			#memory required per node
#SBATCH --job-name trinity_mp39guided
#SBATCH --array=1-20

cd ${SLURM_SUBMIT_DIR}

module load icc/2017.4.196-GCC-6.4.0-2.28
module load impi/2017.3.196
module load Trinity/2.6.6

line=$(sed -n -e "$SLURM_ARRAY_TASK_ID p" mp_readnames_mp39_20.txt)
echo " line: $line"

Trinity \
--genome_guided_bam /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017/Mp39R/mapping_bwa/${line}_masked.sorted.bam \
--genome_guided_max_intron 200 \
--CPU 20 \
--max_memory 80G \
--output ${line}_trinity_Mp39_bwa_nodedup \
--full_cleanup