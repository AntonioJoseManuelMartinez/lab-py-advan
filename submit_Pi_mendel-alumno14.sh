#!/bin/bash

#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno14/lab-py-advan
#SBATCH --job-name=pi_mc
#SBATCH --output=%x_%u_%j.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4

module load anaconda/2025.06

echo "Nodo de ejecución: ${SLURMD_NODENAME}"
echo "CPUs por tarea: ${SLURM_CPUS_PER_TASK}"
echo

ipython pi-par-solution-alumno14.ipynb

echo
echo "Fin de la ejecución"

