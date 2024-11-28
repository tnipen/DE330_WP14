#!/bin/bash

container=/pfs/lustrep3/scratch/project_465000454/anemoi/containers/aifs-met-pytorch-2.2.0-rocm-5.6.1-py3.9-v2.0-new-correct-anemoi-models-sort-vars.sif
virtual_env=`pwd`/.venv

export PYTHONUSERBASE=$virtual_env
export PATH=$PATH:$virtual_env/bin

singularity exec -B /pfs:/pfs $container bash
