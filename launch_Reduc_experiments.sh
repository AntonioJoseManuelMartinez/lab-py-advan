#!/bin/bash

# Script que lanza todos los experimentos del lab (8 trabajos en total)

values=(100000000 1000000000)   # 10^8 y 10^9
cpus=(1 2 4 8)

for v in "${values[@]}"; do
    for c in "${cpus[@]}"; do
        echo "Lanzando job con value=$v y cpus=$c"
        sbatch --cpus-per-task=$c submit_Reduc_mendel-alumno14.sh $v
        sleep 1   # pequeña pausa para evitar saturar SLURM
    done
done

echo "Todos los trabajos han sido enviados."

