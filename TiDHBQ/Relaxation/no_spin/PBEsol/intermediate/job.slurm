#!/bin/bash

# Slurm job options (job-name, compute nodes, job time)
#SBATCH --job-name=TiDHBQ
#SBATCH --time=12:00:00
#SBATCH --nodes=4
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1

# Replace [budget code] below with your budget code (e.g. t01)
#SBATCH --account=e05
#SBATCH --partition=standard
#SBATCH --qos=standard
#SBATCH --export=none

# Restore default module collection PrgEnv-gnu
module -s restore /etc/cray-pe.d/PrgEnv-gnu

# Set the number of threads to 1
#   This prevents any threaded system libraries from automatically
#   using threading.
export OMP_NUM_THREADS=1

#Set stacksize to unlimited for aims
ulimit -s unlimited

# Launch the parallel job
#   Using 512 MPI processes and 128 MPI processes per node
#   srun picks up the distribution from the sbatch options

srun --cpu-bind=cores /work/e05/e05/mat92/Codes/Aims/Oct20_gnu/aims.201021.scalapack.mpi.x > aims.out
