#!/bin/bash -l
#SBATCH --output=/scratch/users/%u/%j.out
#SBATCH --time=0-48:00

d="$1"

#SBATCH --job-name=ker_$d

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate sage_nx_tf
sage -gap -q <<SCR
Read("ConjCheck/kernel_comp.gap");
IsKerTriv(${d});
quit;
SCR