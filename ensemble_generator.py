import os
import glob
import random
import json
import argparse

def parse_option():
    parser = argparse.ArgumentParser('argument for training')

    parser.add_argument('--models', type=str, default=None, help='models to consider')
    parser.add_argument('--out_folder', type=str, default="ensembles")
    parser.add_argument('--n_trials', type=int, default=500, help='tb frequency')
    parser.add_argument('--n_ensembles', type=int, default=2, help='number of models in the ensemble')
    opt = parser.parse_args()
    return opt

def main():
    opt = parse_option()

    if not os.path.exists(opt.out_folder):
        os.makedirs(opt.out_folder)
    print(opt.models)
    model_fs = [f for f in glob.glob(opt.models)]
    print(model_fs)
    # generate the ensembles
    for trial_idx in range(opt.n_trials):
        models = random.choices(model_fs,k=opt.n_ensembles)
        with open(os.path.join(opt.out_folder, f"ensemble_{opt.n_ensembles}_{trial_idx}.json"), "w") as f:
            json.dump( {"ensemble": models },f)

    print("Generated!")

if __name__ == "__main__":
    main()



