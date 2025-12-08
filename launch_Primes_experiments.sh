#!/bin/bash

# Script lanzador para ejecutar primes-par con diferentes valores y núcleos

values=(1000000 10000000)   # number = 10^6 y 10^7
cpus=(1 2 4 8)

for v in "${values[@]}"; do
    for c in "${cpus[@]}"; do
        echo "Lanzando job con number=$v y cpus=$c"
        sbatch --cpus-per-task=$c submit_Primes_mendel-alumno14.sh $v
        sleep 1
    done
done

echo "Todos los trabajos han sido enviados."

