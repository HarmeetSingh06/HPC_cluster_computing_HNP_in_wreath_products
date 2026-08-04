#!/bin/bash -l
#SBATCH --output=/scratch/users/%u/%j.out
#SBATCH --time=0-48:00

d="$1"

#SBATCH --job-name=ker_$d

module load miniforge3 # load miniforge3 for python
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate sage_nx_tf # activate virtual environment sage_nx_tf which has sage

#in the sage platform use the GAP interface to run the below code
sage -gap -q <<SCR 
Read("ConjCheck/kernel_comp.gap");
IsKerTriv(${d});
quit;
SCR
