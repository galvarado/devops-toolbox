#!/bin/bash

# When you run this script, it searches for all files with the ".sh" extension 
# in the current directory and its subdirectories. For each of these files, it sets 
# the execute permission, making them executable shell scripts if they weren't already. 
# This is often done when you have a collection of shell script files that you
# want to make executable so that you can run them from the command line.

# Terminate this script if any command returns an error:
# -e: Exit on error
# -u: Treat uninitialized variables as errors
# -o pipefail: Exit if any command in a pipeline fails
set -eu -o pipefail

find ./ -type f -iname "*.sh" -exec chmod +x {} \;