#!/bin/bash
#
# This script sets up the environment to work with Anemoi. It requires a container
#
# Enter the container by running this:
# singularity exec container.sif bash
#
# Then inside the container, run this script

# Set up folders for storing the Anemoi dependencies. We don't want to create a full virtual
# environment, because we want to also use the packages provided by the python installation
# in the container.
export VIRTUAL_ENV=`pwd`/.venv
if [ ! -d .venv ]; then
    mkdir -p $VIRTUAL_ENV/lib $VIRTUAL_ENV/bin
fi

# Override the userbase to the virtual environment so that packages are installed here
# when --user is provided to pip. Also set the PATH so that we can run the
# anemoi-training entrypoint
export PYTHONUSERBASE=$VIRTUAL_ENV
export PATH=$PATH:$VIRTUAL_ENV/bin

# Clone and install anemoi repository
for repo in datasets models training graphs utils; do
    if [ ! -d anemoi-$repo ]; then
        echo "Cloning $repo"
        git clone git@github.com:ecmwf/anemoi-$repo
    fi
   pip install --user --no-deps -e anemoi-$repo
done


