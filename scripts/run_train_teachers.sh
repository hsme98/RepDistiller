#!/bin/bash

#SBATCH -o train_teacher.log-%j-%a
#SBATCH -a 1-8
#SBATCH -c 4
#SBATCH --gres=gpu:volta:1

source /etc/profile
module load anaconda/2020a
source activate distill_env


python /home/gridsan/herol/RepDistiller/train_teacher.py --model resnet20 --trial $SLURM_ARRAY_TASK_ID
