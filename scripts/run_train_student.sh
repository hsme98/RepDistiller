#!/bin/bash

#SBATCH -o train_teacher.log-%j-%a
#SBATCH -a 1-100  # Adjust this to match the number of files
#SBATCH -c 4
#SBATCH --gres=gpu:volta:1

source /etc/profile
module load anaconda/2022a
module load cuda/11.8
source activate distil_env6

# Define the folder where your files are located
FOLDER="ensembles"

# Create an array of filenames
FILES=($(ls $FOLDER))

# Use SLURM_ARRAY_TASK_ID to pick a specific file
FILE_TO_PROCESS=${FILES[$SLURM_ARRAY_TASK_ID-1]}

echo "Processing file: $FOLDER/$FILE_TO_PROCESS"

# Now pass the file to your python script
python /home/gridsan/herol/RepDistiller/train_student_ensemble.py --model resnet20 --distill crd --joint_mode reg --trial $SLURM_ARRAY_TASK_ID --path_ensemble $FOLDER/$FILE_TO_PROCESS
