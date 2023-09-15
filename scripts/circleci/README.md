# CircleCI scripts

## Prevent parallel jobs

[prevent_parallel_jobs.sh](prevent_parallel_jobs.sh) interacts with the CircleCI API to check if there are other workflows with the same name running in previously created pipelines. If such workflows exist, it cancels the current workflow execution to avoid conflicts. It's a mechanism to manage workflow executions in a CircleCI environment to ensure that only one workflow with a specific name is running at a time.

By design the “Auto-cancel redundant builds functionality does not apply to the project’s default branch.
This solution is based on [this workaround](https://discuss.circleci.com/t/workaround-auto-cancel-redundant-builds-on-the-default-branch/39468).

Dependencies:

- CIRCLE_TOKEN: this environment variable is required to authenticate with the CircleCI API. It should contain your CircleCI Personal API token as Project-specific tokens are currently [not supported](https://discuss.circleci.com/t/v2-api-cannot-be-accessed-with-project-api-token/35914) on API v2.
- VCS_SLUG: e.g. BitBucket(bb), GitHub(gh)
- ORGANIZATION: The parent organization of repository

This script should be added as a step in a job as:

```
steps:
- run:
  name: Prevent parallel jobs
  command:
  bash ./.circleci/scripts/prevent_parallel_builds.sh
```
