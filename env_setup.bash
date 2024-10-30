#!/bin/bash

# Set env_dir to first argument or default to './env' if none is provided
env_dir="${1:-./env}"

# Check if env_dir already exists
if [ -d "${env_dir}" ]; then
    echo "Error: Directory '${env_dir}' already exists. Choose a different directory or delete the existing one."
    exit 1
fi

# Create the virtual environment in env_dir
python3 -m venv "${env_dir}" || { echo "Failed to create virtual environment"; exit 1; }

# Activate the virtual environment
source "${env_dir}/bin/activate" || { echo "Failed to activate virtual environment"; exit 1; }

# Upgrade pip and install required packages with specific versions
pip install --upgrade pip==22.2.2 || { echo "Failed to upgrade pip"; exit 1; }

# Install packages in a single command to streamline process and improve speed
pip install \
    ipykernel==6.16 \
    jinja2 \
    typeguard \
    pyyaml \
    hydra-core==1.2.0 \
    dill==0.3.5.1 \
    torch==2.0.1 \
    wandb==0.13.3 \
    tqdm==4.64.1 \
    numpy==1.23.3 \
    einops==0.4.1 \
    diffusers==0.11.1 \
    zarr==2.12.0 \
    torchvision==0.15.2 \
    pandas \
    numba==0.56.4 \
    gym==0.21.0 \
    pygame==2.1.2 \
    pymunk==6.2.1 \
    shapely==1.8.4 \
    opencv-python==4.6.0.66 \
    scikit-image==0.19.3 \
    av==10.0.0 \
    imagecodecs==2022.8.8 \
    robomimic==0.2.0 \
    cuda-python==11.6 \
    threadpoolctl==3.1.0 \
    "git+https://github.com/facebookresearch/pytorch3d.git@v0.7.0" \
    tensorboard==2.10.1 \
    tensorboardx==2.5.1 \
    tensorflow==2.10.1 \
    tensorflow-probability==0.18.0 \
    tf-agents==0.15.0 \
    pybullet-svl==3.1.6.4 \
    matplotlib==3.6.1 \
    free-mujoco-py==2.1.6 \
    pynput==1.7.6 \
    atomics==1.0.2 || { echo "Failed to install packages"; exit 1; }

# Note: Some packages that require additional dependencies or specific installation instructions are commented out
# Uncomment and install dependencies as needed for:
# - robosuite
# - pyrealsense2
# - spnav

echo "Virtual environment successfully created at '${env_dir}' and required packages installed."
