#!/bin/bash

# Function to check if a specific version of cmake is installed
is_cmake_version_installed() {
    local version=$1
    local installed_version

    # Check if cmake is installed and retrieve its version
    if command -v cmake &>/dev/null; then
        installed_version=$(cmake --version | head -n1 | cut -d ' ' -f3)
        if [ "$installed_version" = "$version" ]; then
            return 0 # 0 means true in bash scripting (success)
        fi
    fi

    return 1 # 1 means false in bash scripting (failure)
}

# Desired version of CMake
required_version="3.28.1"

# Check if CMake 3.28 is already installed
if is_cmake_version_installed "$required_version"; then
    echo "CMake version $required_version is already installed."
else
    echo "CMake version $required_version is not installed. Running the installation script."
    sudo bash ./cmake-unpack.sh --prefix=/usr/local --exclude-subdir
fi
