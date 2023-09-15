#!/bin/sh

# Set the AWS environment variables for an AWS profile
#
# Example:
#
#    ./aws_env profile-for-testing
#
# Dependencies:
#
#    - AWS CLI (aws): The script uses the AWS Command Line Interface (aws) to interact with AWS services
#    - ~/.aws/credentials: The script reads AWS profiles from the ~/.aws/credentials file. Ensure that this file exists and contains valid AWS credentials with profiles.

# Terminate this script if any command returns an error:
# -e: Exit on error
# -u: Treat uninitialized variables as errors
# -o pipefail: Exit if any command in a pipeline fails
set -eu -o pipefail

echo "# Environment for AWS profile '$1'"
echo export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1)
echo export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1)
echo export AWS_DEFAULT_REGION=$(aws configure get region --profile $1)

echo "# Run this command to configure your shell:"
echo "# eval \$($0 ${@})"