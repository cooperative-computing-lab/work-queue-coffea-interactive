# Create a new environment
conda create --name coffea-env
conda activate coffea-env

# Install Coffea and Work Queue into the environment
conda install python=3.8.3 six dill
conda install -c conda-forge coffea ndcctools conda-pack xrootd

# Pack the environment into a portable tarball.
conda-pack --name coffea-env --output coffea-env.tar.gz
