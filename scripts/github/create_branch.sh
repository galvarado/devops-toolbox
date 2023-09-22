#!/bin/sh

# Script to create a branch locally and at the upstream repository
#
# Example:
#
#    ./create_branch.sh main feature-branch
#
# Dependencies:
#
#    - The remote upstream must be configured
#    - The fork repository must be cloned. It is refered as the origin.
#    - This script use update_fork as a pre step to create the feature branch from an up-to-date branch

# Terminate this script if any command returns an error:
# -e: Exit on error
# -u: Treat uninitialized variables as errors
# -o pipefail: Exit if any command in a pipeline fails

set -eu -o pipefail

# Get the branch name as an argument
from_branch=$1
feature_branch=$2

./update_fork $from_branch

git checkout -b $feature_branch
git push origin $feature_branch
git push upstrean $feature_branch