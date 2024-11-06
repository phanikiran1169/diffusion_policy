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

# Manually install/upgrade pip
print_command "Upgrading pip"
python3 install --upgrade pip || { echo "Failed to upgrade pip"; exit 1; }

# Install each package individually with command message
print_command "Installing wheel"
pip install wheel || { echo "Failed to install wheel"; exit 1; }

print_command "Installing torch"
pip install torch || { echo "Failed to install torch"; exit 1; }

print_command "Installing ipykernel"
pip install ipykernel || { echo "Failed to install ipykernel"; exit 1; }

print_command "Installing jinja2"
pip install jinja2 || { echo "Failed to install jinja2"; exit 1; }

print_command "Installing typeguard"
pip install typeguard || { echo "Failed to install typeguard"; exit 1; }

print_command "Installing pyyaml"
pip install pyyaml || { echo "Failed to install pyyaml"; exit 1; }

print_command "Installing hydra-core"
pip install hydra-core || { echo "Failed to install hydra-core"; exit 1; }

print_command "Installing dill"
pip install dill || { echo "Failed to install dill"; exit 1; }

print_command "Installing wandb"
pip install wandb || { echo "Failed to install wandb"; exit 1; }

print_command "Installing tqdm"
pip install tqdm || { echo "Failed to install tqdm"; exit 1; }

print_command "Installing numpy"
pip install numpy || { echo "Failed to install numpy"; exit 1; }

print_command "Installing einops"
pip install einops || { echo "Failed to install einops"; exit 1; }

print_command "Installing diffusers"
pip install diffusers || { echo "Failed to install diffusers"; exit 1; }

print_command "Installing zarr"
pip install zarr || { echo "Failed to install zarr"; exit 1; }

print_command "Installing torchvision"
pip install torchvision || { echo "Failed to install torchvision"; exit 1; }

print_command "Installing pandas"
pip install pandas || { echo "Failed to install pandas"; exit 1; }

print_command "Installing numba"
pip install numba || { echo "Failed to install numba"; exit 1; }

print_command "Installing gym"
pip install gym || { echo "Failed to install gym"; exit 1; }

print_command "Installing pygame"
pip install pygame || { echo "Failed to install pygame"; exit 1; }

print_command "Installing pymunk"
pip install pymunk || { echo "Failed to install pymunk"; exit 1; }

print_command "Installing shapely"
pip install shapely || { echo "Failed to install shapely"; exit 1; }

print_command "Installing opencv-python"
pip install opencv-python || { echo "Failed to install opencv-python"; exit 1; }

print_command "Installing scikit-image"
pip install scikit-image || { echo "Failed to install scikit-image"; exit 1; }

print_command "Installing av"
pip install av || { echo "Failed to install av"; exit 1; }

print_command "Installing imagecodecs"
pip install imagecodecs || { echo "Failed to install imagecodecs"; exit 1; }

print_command "Installing robomimic"
pip install robomimic || { echo "Failed to install robomimic"; exit 1; }

print_command "Installing cuda-python"
pip install cuda-python || { echo "Failed to install cuda-python"; exit 1; }

print_command "Installing threadpoolctl"
pip install threadpoolctl || { echo "Failed to install threadpoolctl"; exit 1; }

print_command "Installing pytorch3d"
pip install "git+https://github.com/facebookresearch/pytorch3d.git" || { echo "Failed to install pytorch3d"; exit 1; }

print_command "Installing tensorboard"
pip install tensorboard || { echo "Failed to install tensorboard"; exit 1; }

print_command "Installing tensorboardx"
pip install tensorboardx || { echo "Failed to install tensorboardx"; exit 1; }

print_command "Installing tensorflow"
pip install tensorflow || { echo "Failed to install tensorflow"; exit 1; }

print_command "Installing tensorflow-probability"
pip install tensorflow-probability || { echo "Failed to install tensorflow-probability"; exit 1; }

# print_command "Installing tf-agents"
# pip install tf-agents || { echo "Failed to install tf-agents"; exit 1; }

print_command "Installing pybullet-svl"
pip install pybullet-svl || { echo "Failed to install pybullet-svl"; exit 1; }

print_command "Installing matplotlib"
pip install matplotlib || { echo "Failed to install matplotlib"; exit 1; }

# print_command "Installing free-mujoco-py"
# pip install free-mujoco-py || { echo "Failed to install free-mujoco-py"; exit 1; }

print_command "Installing pynput"
pip install pynput || { echo "Failed to install pynput"; exit 1; }

print_command "Installing atomics"
pip install atomics || { echo "Failed to install atomics"; exit 1; }

# Note: Some packages that require additional dependencies or specific installation instructions are commented out
# Uncomment and install dependencies as needed for:
# - robosuite
# - pyrealsense2
# - spnav

echo "Virtual environment successfully created at '${env_dir}' and required packages installed."
