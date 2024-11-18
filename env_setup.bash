#!/bin/bash

# Check for Python 3.10
required_version="3.10"
python_version=$(python3 --version 2>&1 | awk '{print $2}')
if [[ "${python_version}" != "${required_version}"* ]]; then
    echo "Error: Python ${required_version} is required. Detected version: ${python_version}"
    exit 1
fi

# Function to print commands in bold cyan
print_command() {
    echo -e "\033[1;36m>> Running: $1\033[0m"
}

# Set env_dir to first argument or default to './env' if none is provided
env_dir="${1:-./env}"

# Check if env_dir already exists
if [ -d "${env_dir}" ]; then
    echo "Error: Directory '${env_dir}' already exists. Choose a different directory or delete the existing one."
    exit 1
fi

# Create the virtual environment in env_dir
print_command "Creating virtual environment in ${env_dir}"
python3 -m venv "${env_dir}" || { echo "Failed to create virtual environment"; exit 1; }

# Activate the virtual environment
print_command "Activating virtual environment"
source "${env_dir}/bin/activate" || { echo "Failed to activate virtual environment"; exit 1; }

# Check if the environment was activated
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Error: Failed to activate the Python virtual environment."
    exit 1
else
    echo "Python virtual environment successfully activated."
fi

# # Manually install/upgrade pip
# print_command "Upgrading pip"
# python3 install --upgrade pip || { echo "Failed to upgrade pip"; exit 1; }

print_command "Installing pip"
pip install pip==22.2.2 || { echo "Failed to install wheel"; exit 1; }

# Install each package individually with command message
print_command "Installing wheel"
pip install wheel || { echo "Failed to install wheel"; exit 1; }

print_command "Installing torch"
pip install torch==2.0.1 || { echo "Failed to install torch"; exit 1; }

print_command "Installing ipykernel"
pip install ipykernel==6.16 || { echo "Failed to install ipykernel"; exit 1; }

print_command "Installing jinja2"
pip install jinja2 || { echo "Failed to install jinja2"; exit 1; }

print_command "Installing typeguard"
pip install typeguard || { echo "Failed to install typeguard"; exit 1; }

print_command "Installing pyyaml"
pip install pyyaml || { echo "Failed to install pyyaml"; exit 1; }

print_command "Installing hydra-core"
pip install hydra-core==1.2.0 || { echo "Failed to install hydra-core"; exit 1; }

print_command "Installing dill"
pip install dill==0.3.5.1 || { echo "Failed to install dill"; exit 1; }

print_command "Installing wandb"
pip install wandb==0.13.3 || { echo "Failed to install wandb"; exit 1; }

print_command "Installing tqdm"
pip install tqdm==4.64.1 || { echo "Failed to install tqdm"; exit 1; }

print_command "Installing numpy"
pip install numpy==1.23.3 || { echo "Failed to install numpy"; exit 1; }

print_command "Installing einops"
pip install einops==0.4.1 || { echo "Failed to install einops"; exit 1; }

print_command "Installing diffusers"
pip install diffusers==0.11.1 || { echo "Failed to install diffusers"; exit 1; }

print_command "Installing zarr"
pip install zarr==2.12.0 || { echo "Failed to install zarr"; exit 1; }

print_command "Installing torchvision"
pip install torchvision==0.15.2 || { echo "Failed to install torchvision"; exit 1; }

print_command "Installing pandas"
pip install pandas || { echo "Failed to install pandas"; exit 1; }

print_command "Installing numba"
pip install numba==0.60.0 || { echo "Failed to install numba"; exit 1; }

print_command "Installing gym"
pip install gym==0.21.0 || { echo "Failed to install gym"; exit 1; }

print_command "Installing pygame"
pip install pygame==2.1.2 || { echo "Failed to install pygame"; exit 1; }

print_command "Installing pymunk"
pip install pymunk==6.2.1 || { echo "Failed to install pymunk"; exit 1; }

print_command "Installing shapely"
pip install shapely==1.8.4 || { echo "Failed to install shapely"; exit 1; }

print_command "Installing opencv-python"
pip install opencv-python==4.6.0.66 || { echo "Failed to install opencv-python"; exit 1; }

print_command "Installing scikit-image"
pip install scikit-image==0.19.3 || { echo "Failed to install scikit-image"; exit 1; }

print_command "Installing av"
pip install av==10.0.0 || { echo "Failed to install av"; exit 1; }

print_command "Installing imagecodecs"
pip install imagecodecs==2022.8.8 || { echo "Failed to install imagecodecs"; exit 1; }

print_command "Installing robomimic"
pip install robomimic==0.2.0 || { echo "Failed to install robomimic"; exit 1; }

print_command "Installing cuda-python"
pip install cuda-python==11.6 || { echo "Failed to install cuda-python"; exit 1; }

print_command "Installing threadpoolctl"
pip install threadpoolctl==3.1.0 || { echo "Failed to install threadpoolctl"; exit 1; }

print_command "Installing pytorch3d"
pip install "git+https://github.com/facebookresearch/pytorch3d.git@v0.7.0" || { echo "Failed to install pytorch3d"; exit 1; }

print_command "Installing tensorboard"
pip install tensorboard==2.10.1 || { echo "Failed to install tensorboard"; exit 1; }

print_command "Installing tensorboardx"
pip install tensorboardx==2.5.1 || { echo "Failed to install tensorboardx"; exit 1; }

print_command "Installing tensorflow"
pip install tensorflow==2.10.1 || { echo "Failed to install tensorflow"; exit 1; }

print_command "Installing tensorflow-probability"
pip install tensorflow-probability==0.18.0 || { echo "Failed to install tensorflow-probability"; exit 1; }

print_command "Installing tf-agents"
pip install tf-agents==0.15.0 || { echo "Failed to install tf-agents"; exit 1; }

print_command "Installing pybullet-svl"
pip install pybullet-svl==3.1.6.4 || { echo "Failed to install pybullet-svl"; exit 1; }

print_command "Installing matplotlib"
pip install matplotlib==3.6.1 || { echo "Failed to install matplotlib"; exit 1; }

print_command "Installing free-mujoco-py"
pip install free-mujoco-py==2.1.6 || { echo "Failed to install free-mujoco-py"; exit 1; }

print_command "Installing pynput"
pip install pynput==1.7.6 || { echo "Failed to install pynput"; exit 1; }

print_command "Installing atomics"
pip install atomics==1.0.2 || { echo "Failed to install atomics"; exit 1; }

# Note: Some packages that require additional dependencies or specific installation instructions are commented out
# Uncomment and install dependencies as needed for:
# - robosuite
# - pyrealsense2
# - spnav

echo "Virtual environment successfully created at '${env_dir}' and required packages installed."
