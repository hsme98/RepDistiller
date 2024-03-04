#!/bin/bash

source etc/profile.d/conda.sh
conda activate distil_env
# Define a list of items
items=("2" "4" "6" "8")

# Loop through the list
for item in "${items[@]}"
do
    python ensemble_generator.py --models 'save/models/resnet20_cifar100_lr_0.05_decay_0.0005_trial_*' --out_folder ensembles --n_trials 48 --n_ensembles $item
done
