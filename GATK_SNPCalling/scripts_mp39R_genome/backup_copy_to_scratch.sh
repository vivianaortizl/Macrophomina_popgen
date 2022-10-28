#!/bin/bash --login
#SBATCH --time=48:00:00 	# limit of wall clock times
#SBATCH --nodes=1                 # number of different nodes - could be an exact number or a range of nodes (same as -N)
#SBATCH --ntasks=1		# how many tasks per node
#SBATCH --cpus-per-task=20	# number of CPUs (or cores) per task
#SBATCH --mem=2G			#memory required per allocated CPU (or core) - amount of memory (in bytes)
#SBATCH --job-name copy_to_scratch


cd ${SLURM_SUBMIT_DIR}

cp -r /mnt/home/ortizviv/08312017_mp_whgenome/workdata_08312017 ./workdata_08312017_scratch