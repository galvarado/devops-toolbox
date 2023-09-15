#!/bin/bash
# Author: Guillermo Alvarado

# This script interacts with the CircleCI API to check if there are other workflows with the same name running in previously created pipelines.
#If such workflows exist, it cancels the current workflow execution to avoid conflicts. It's a mechanism to manage workflow executions in a CircleCI environment to ensure that only one workflow with a specific name is running at a time.

# Dependencies:
#     - CIRCLE_TOKEN: this environment variable is required to authenticate with the CircleCI API.
#     It should contain your CircleCI Personal API token as Project-specific tokens are currently not supported on API v2 
#     https://discuss.circleci.com/t/v2-api-cannot-be-accessed-with-project-api-token/35914
#     - VCS_SLUG: e.g. BitBucket(bb), GitHub(gh)
#     - ORGANIZATION: The parent organization of repository  

# Set options for error handling
set -eu -o pipefail # Causes this script to terminate if any command returns an error

VCS_SLUG=gh
ORGANIZATION=galvarado

# Step 1: Get the name of the workflow and the related pipeline number
curl --header "Circle-Token: $CIRCLE_TOKEN" --request GET "https://circleci.com/api/v2/workflow/${CIRCLE_WORKFLOW_ID}" -o current_workflow.json
WF_NAME=$(jq -r '.name' current_workflow.json)
CURRENT_PIPELINE_NUM=$(jq -r '.pipeline_number' current_workflow.json)

# Step 2: Get the IDs of pipelines created by the current user on the same branch
PIPE_IDS=$(curl --header "Circle-Token: $CIRCLE_TOKEN" --request GET "https://circleci.com/api/v2/project/$VCS_SLUG/$ORGANIZATION/$CIRCLE_PROJECT_REPONAME/pipeline?branch=$CIRCLE_BRANCH"|jq -r --argjson CURRENT_PIPELINE_NUM "$CURRENT_PIPELINE_NUM" '.items[] | select(.state == "created") | select(.number < $CURRENT_PIPELINE_NUM)|.id')

# Step 3: Get the IDs of currently running/on_hold workflows with the same name in previously created pipelines
if [ ! -z "$PIPE_IDS" ]; then
  for PIPE_ID in $PIPE_IDS
  do
    curl --header "Circle-Token: $CIRCLE_TOKEN" --request GET "https://circleci.com/api/v2/pipeline/${PIPE_ID}/workflow"|jq -r --arg WF_NAME "${WF_NAME}" '.items[]|select(.status == "running") | select(.name == $WF_NAME) | .id' >> OTHER_WF.txt
  done
fi

# Step 4: Cancel currently running workflow with the same name as there is other running with a previous creation time:
if [ -s OTHER_WF.txt ]; then
  echo "Cancelling this execution as there is other running with a previous creation time:"
  cat OTHER_WF.txt 
  curl --header "Circle-Token: $CIRCLE_TOKEN" --request POST https://circleci.com/api/v2/workflow/$CIRCLE_WORKFLOW_ID/cancel
  ## Allowing some time to complete the cancellation
  sleep 2
  else
    echo "Nothing to cancel"
fi