#!/bin/bash
# Author: Guillermo Alvarado
# This script streamlines switching kubectl configurations, making it easier to manage Kubernetes clusters
# across various AWS profiles or environments. It provides an interactive menu for selecting AWS profile
# and also accepts profile names as command-line arguments for non-interactive use.
# Example:
#
#    ./switch_kubectl.sh
#
# Dependencies:
#    - AWS CLI (aws): The script uses the AWS Command Line Interface (aws) to interact with AWS services
#    - kubectl: The script uses kubectl commands to manage Kubernetes configurations and contexts.
#    - ~/.aws/credentials: The script reads AWS profiles from the ~/.aws/credentials file. Ensure that this file exists and contains valid AWS credentials with profiles.


# Terminate this script if any command returns an error:
# -e: Exit on error
# -u: Treat uninitialized variables as errors
# -o pipefail: Exit if any command in a pipeline fails
set -eu -o pipefail

CLUSTER='some-eks-cluster'

switch_kubectl_config() {
  local profile=$1
  aws eks update-kubeconfig --name "$CLUSTER" --profile "$profile"
  kubectl config current-context
  #kubectl config set-context --current --namespace=ikon
  echo "Switched kubectl config to profile: $profile"
}

menu() {
  local input="$HOME/.aws/credentials"
  local available_profiles=()

  echo "Switching kubectl config"
  date
  echo

  while IFS= read -r line; do
    if [[ $line =~ ^\[([^\]]+)\]$ ]]; then
      available_profiles+=("${BASH_REMATCH[1]}")
    fi
  done < "$input"

  PS3="Select profile: "
  select profile in "${available_profiles[@]}"; do
    if [[ -n $profile ]]; then
      switch_kubectl_config "$profile"
      break
    else
      echo "Invalid choice. Please try again."
    fi
  done
}

# Main
if [[ $# -eq 0 ]]; then
  menu
else
  profile=$1
  switch_kubectl_config "$profile"
fi
