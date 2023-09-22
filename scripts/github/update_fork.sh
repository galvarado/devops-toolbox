#!/bin/sh

# Script to update a forked branch with the upstream
#
# Example:
#
#    ./update_fork.sh main
#
# Dependencies:
#
#    - The remote upstream must be configured
#    - The fork repository must be cloned. It is refered as the origin.

# Terminate this script if any command returns an error:
# -e: Exit on error
# -u: Treat uninitialized variables as errors
# -o pipefail: Exit if any command in a pipeline fails

set -eu -o pipefail

# Get the branch name as an argument
branch=$1

# Check if the branch is configured with an upstream
if ! git remote -v | grep -q "upstream"; then
  echo "The upstream remote is not configured. Please configure it first."
  exit 1
fi

# Update the upstream remote
git fetch upstream

# Merge or rebase the branch with the changes from the upstream
git checkout "$branch"
git merge upstream/"$branch"  # Optionally, you can use git rebase instead of git merge

# Push the updated changes to the remote repository (fork)
git push origin "$branch"