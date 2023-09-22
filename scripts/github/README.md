# Github scripts

## Update forked branch with upstream

[update_fork.sh](update_fork.sh) script automates the process of creating a branch locally and at the upstream repository, ensuring that the branch is up-to-date and pushed to the appropriate repositories.

Dependencies:

- The remote upstream must be configure
- The fork repository must be cloned. It is refered as the origin.

Example:

```
update_fork.sh main
```

## Create a branch locally and at the upstream repository forked branch with upstream

[create_branch.sh](create_branch.sh) script sync your forked branch with the latest changes from the upstream repository, ensuring that your branch stays up to date. If you have made changes to your forked branch and want to contribute those changes back to the original repository, it's important to keep your branch in sync with the upstream. This script simplifies the process of updating your branch with the latest changes from the upstream, making it easier to create clean and up-to-date pull requests.

Dependencies:

- The remote upstream must be configure
- The fork repository must be cloned. It is refered as the origin.
- This script use [update_fork.sh](update_fork.sh) as a pre step to create the feature branch from an up-to-date branch

Example:

```
create_branch.sh main feature-branch
```
