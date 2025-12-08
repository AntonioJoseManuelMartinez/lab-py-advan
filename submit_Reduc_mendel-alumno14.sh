#!/bin/bash

#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno14/lab-py-advan
#SBATCH --job-name=reduc_operation
#SBATCH --output=%x_%u_%j.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1

module load anaconda/2025.06

# Primer argumento: número de elementos (value)
value="$1"

echo "Número de elementos (value): ${value}"
echo "CPUs por tarea (SLURM_CPUS_PER_TASK): ${SLURM_CPUS_PER_TASK}"
echo "Nodo de ejecución: ${SLURMD_NODENAME}"
echo

# Ejecutar el notebook con ipython, pasando value como argumento
ipython reduc-operation-array-par-alumno14.ipynb -- "${value}"

echo
echo "Fin de la ejecución"

