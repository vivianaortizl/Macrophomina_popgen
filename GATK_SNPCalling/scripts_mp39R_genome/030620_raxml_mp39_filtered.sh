#!/bin/bash --login
#SBATCH --time=48:00:00 	# limit of wall clock times
#SBATCH --nodes=1                 # number of different nodes - could be an exact number or a range of nodes (same as -N)
#SBATCH --ntasks=1		# how many tasks per node
#SBATCH --cpus-per-task=20	# number of CPUs (or cores) per task
#SBATCH --mem=2G			#memory required per allocated CPU (or core) - amount of memory (in bytes)
#SBATCH --job-name copy_to_scratch

cd ${SLURM_SUBMIT_DIR}

module load GNU/4.9
module load raxml/8.2.10

raxmlHPC -s MS6_dedup_I96_MAF002_q40_sfi_phyint.phy -n MS6_dedup_I96_MAF002_q40_sfi -m ASC_GTRGAMMA --asc-corr=lewis -p 12345 -b 13331 -N 1000
