#!/bin/bash

#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno14/lab-py-advan
#SBATCH --job-name=primes
#SBATCH --output=%x_%u_%j.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1

module load anaconda/2025.06

# Primer argumento: número de elementos (number)
number="$1"

echo "Número de elementos (number): ${number}"
echo "CPUs por tarea (SLURM_CPUS_PER_TASK): ${SLURM_CPUS_PER_TASK}"
echo "Nodo de ejecución: ${SLURMD_NODENAME}"
echo

# Para que Numba/OpenMP use el mismo número de hilos que SLURM le da
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# Ejecutar el notebook con ipython, pasando number como argumento
ipython primes-par-alumno14.ipynb -- "${number}"

echo
echo "Fin de la ejecución"

