# AWS scripts

## Kubernetes Configuration Switcher for EKS

This script streamlines switching kubectl configurations, making it easier to manage Kubernetes clusters
across various AWS profiles or environments. It provides an interactive menu for selecting AWS profile
and also accepts profile names as command-line arguments for non-interactive use.
Example:

    use it with a menu to select the profile to use:
      ```
      ./switch_kubectl.sh
      ```

    use it with a profile:
      ```
      ./switch_kubectl.sh my-aws-profile
      ```

Dependencies:

- [aws](https://aws.amazon.com/es/cli/) cli : The script uses the AWS Command Line Interface (aws) to interact with AWS services
- [kubectl](https://kubernetes.io/es/docs/tasks/tools/): The script uses kubectl commands to manage Kubernetes configurations and contexts.
- [~/.aws/credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html): The script reads AWS profiles from the ~/.aws/credentials file. Ensure that this file exists and contains valid AWS credentials with profiles.
