#!/usr/bin/bash 
# The script runs calculations for the size of each S3 bucket in the specified AWS profile
# and appends the results to the "allregions-buckets-s3-sizes.csv" file. 
# It provides feedback on the progress of the calculations for each bucket.
#
# Example:
#
#    ./bucket_size.sh
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

set +x # This command turns off debugging output. Debugging output is usually enabled with set -x, but in this script, it's disabled with set +x to reduce verbosity.

PROFILE="test-profile"
function calcs3bucketsize() {
    sizeInBytes=`aws --profile ${PROFILE} s3 ls s3://"${1}" --recursive --human-readable --summarize | awk END'{print}'`
    echo ${1},${sizeInBytes} >> allregions-buckets-s3-sizes.csv
    printf "DONE. Size of the bucket ${1}. %s\n " "${sizeInBytes}"  
}

[ -f allregions-buckets-s3-sizes.csv ] && rm -fr allregions-buckets-s3-sizes.csv

buckets=`aws --profile ${PROFILE}  s3 ls | awk '{print $3}'`}

i=1
for j in ${buckets}; do
    printf "calculating the size of the bucket[%s]=%s. \n " "${i}" "${j}"   
    i=$((i+1))
    # to expedite the calculation, make the cli commands run parallel in the background
    calcs3bucketsize ${j} &
done