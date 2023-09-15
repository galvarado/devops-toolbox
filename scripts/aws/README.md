# AWS scripts

## Kubernetes Configuration Switcher for EKS

[switch_kubectl.sh](switch_kubectl.sh) script streamlines switching kubectl configurations, making it easier to manage Kubernetes clusters
across various AWS profiles or environments. It provides an interactive menu for selecting AWS profile
and also accepts profile names as command-line arguments for non-interactive use.

Example:

Use it with a menu to select the profile to use:

```
./switch_kubectl.sh
```

Use it with a profile:

```
./switch_kubectl.sh my-aws-profile
```

Dependencies:

- [aws](https://aws.amazon.com/es/cli/) cli : The script uses the AWS Command Line Interface (aws) to interact with AWS services
- [kubectl](https://kubernetes.io/es/docs/tasks/tools/): The script uses kubectl commands to manage Kubernetes configurations and contexts.
- [~/.aws/credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html): The script reads AWS profiles from the ~/.aws/credentials file. Ensure that this file exists and contains valid AWS credentials with profiles.

## AWS Profile Environment Setter

[export_aws_env.sh](export_aws_env.sh) script sets the AWS environment variables for an AWS profile. It simplifies the process of managing and switching AWS profiles, Alsd note that aws cli has an option to pass directly the profile to use using the `--profile` flag or you can use the

Example:

```
./aws_env profile-for-testing
```

Dependencies:

- [aws](https://aws.amazon.com/es/cli/) cli : The script uses the AWS Command Line Interface (aws) to interact with AWS services
- [~/.aws/credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html): The script reads AWS profiles from the ~/.aws/credentials file. Ensure that this file exists and contains valid AWS credentials with profiles.

## AWS S3 Bucket Size Calculator

[bucket_size.sh](bucket_size.sh) script runs calculations for the size of each S3 bucket in the specified AWS profile and appends the results to the `allregions-buckets-s3-sizes.csv` file. It provides feedback on the progress of the calculations for each bucket.

Example:

```
./bucket_size.sh my-aws-profile
```

Dependencies:

- [aws](https://aws.amazon.com/es/cli/) cli : The script uses the AWS Command Line Interface (aws) to interact with AWS services
- [~/.aws/credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html): The script reads AWS profiles from the ~/.aws/credentials file. Ensure that this file exists and contains valid AWS credentials with profiles.
