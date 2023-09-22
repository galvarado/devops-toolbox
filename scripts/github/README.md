# Github scripts

## Update forked branch with upstream

[update_fork.sh](update_fork.sh) script sync your forked branch with the latest changes from the upstream repository, ensuring that your branch stays up to date. If you have made changes to your forked branch and want to contribute those changes back to the original repository, it's important to keep your branch in sync with the upstream. This script simplifies the process of updating your branch with the latest changes from the upstream, making it easier to create clean and up-to-date pull requests.

Dependencies:

- The remote upstream must be configure
- The fork repository must be cloned. It is refered as the origin.

Example:

```
update_fork.sh main
```
