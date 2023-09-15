import requests
import os

def test_slack_token(token):
  # Define the Slack API URL for token validation
  url = "https://slack.com/api/auth.test"
  
  # Set the authorization header with the provided token
  headers = {"Authorization": f"Bearer {token}"}
  
  # Send a GET request to Slack's API
  response = requests.get(url, headers=headers)
  
  # Parse the response JSON data
  data = response.json()

  # Check if the response indicates a valid token
  if response.status_code == 200 and data["ok"]:
    print("Token is valid")
    print("Workspace:", data["team"])
    print("User:", data["user"])
  else:
    print("Invalid token")
    print("Error:", data["error"])

# Retrieve the Slack access token from an environment variable named 'SLACK_ACCESS_TOKEN'
slack_access_token = os.environ.get('SLACK_ACCESS_TOKEN')

# Call the function to test the provided Slack access token
if slack_access_token:
    test_slack_token(slack_access_token)
else:
    print("SLACK_ACCESS_TOKEN environment variable not set. Please set the variable with your Slack access token.")
