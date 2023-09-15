# Kubernetes resources

## aws-cli pod

[awscli-pod.yaml.sh](awscli-pod.yaml.sh) Enables you to use the AWS CLI version 2 in a container-based environment without having to manage the installation yourself.
It uses the official [aws-cli](https://hub.docker.com/r/amazon/aws-cli) image. More info at he [AWS documentation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-docker.html)

Create the pod:

```
kubernetes apply -f awscli-pod.yaml
```

Retrieve information about the IAM identity currently being used within the container named "awscli.":

```
kubernetes exec -it awscli  -- aws sts get-caller-identity
```

It will provide details about the AWS account and user associated with the IAM credentials being used.

Search for environment variables related to AWS within the container named "awscli.":

```
kubernetes exec -it awscli env | grep AWS
```

It will list any environment variables that include "AWS" in their names or values. This is useful for verifying AWS-related configurations and credentials within the container.
