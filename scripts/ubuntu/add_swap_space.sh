#!/bin/bash
# Author: Guillermo Alvarado
# This script is designed to create and enable a swap file on a Ubuntu system. Swap files are used to supplement physical memory (RAM)
# by providing additional virtual memory. The script calculates the swap size based on the system's total memory and creates a swap file of the same size.
# It then sets the correct permissions, marks the file as swap space, enables the swap file, and makes it permanent by adding an entry to the /etc/fstab
# Example:
#
#    ./add_swap_space.sh
#
# Dependencies:
#    - Sufficient disk space to create the swap file.


# Terminate this script if any command returns an error:
# -e: Exit on error
# -u: Treat uninitialized variables as errors
# -o pipefail: Exit if any command in a pipeline fails
set -eu -o pipefail

# Step 1: Check current swap space
free -h

# Step 2: Calculate swap size as same amount of memory
memory=$(free --si --mega | grep Mem: | awk '{print \$2}')
swap_size="${memory}M"

# Step 3: Create a swap file
sudo fallocate -l $swap_size /swapfile

# Step 4: Set correct permissions
sudo chmod 600 /swapfile

# Step 5: Mark the file as swap space
sudo mkswap /swapfile

# Step 6: Enable the swap file
sudo swapon /swapfile

# Step 7: Make the swap file permanent
echo '/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab

# Step 8: Verify the swap space
sudo swapon --show
free -h

