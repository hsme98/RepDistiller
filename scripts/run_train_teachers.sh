#!/bin/bash

#SBATCH -o train_teacher.log-%j-%a
#SBATCH -a 1
#SBATCH -c 12
#SBATCH --gres=gpu:volta:1

source /etc/profile
module load anaconda/2022a
module load cuda/11.8
source activate distil_env5
echo begin
python /home/gridsan/herol/RepDistiller/train_teacher.py --model resnet20 --trial $SLURM_ARRAY_TASK_ID
