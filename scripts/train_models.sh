#!/bin/bash


if [ $# -ne 3 ]; then
    echo "Usage: $0 <model_name> <num_executions> <cuda_dev>"
    exit 1
fi
# Number of times to execute the Python file
num_executions=$2
model=$1
cuda_dev=$3

source /home/hsme/miniconda3/etc/profile.d/conda.sh

conda activate distil_env
# Path to the Python file
python_file="/home/hsme/Desktop/RepDistiller/train_teacher.py"

# Loop through the specified number of times
for ((i=0; i<num_executions; i++)); do
    echo "Executing $model $((i+1))  time..."
    python3 "$python_file" --trial $i --model $model --cuda_dev $cuda_dev
done
