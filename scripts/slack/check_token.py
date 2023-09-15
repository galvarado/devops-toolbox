import requests
import os


def test_slack_token(token):
  url = "https://slack.com/api/auth.test"
  headers = {"Authorization": f"Bearer {token}"}
  response = requests.get(url, headers=headers)
  data = response.json()

  if response.status_code == 200 and data["ok"]:
    print("Token is valid")
    print("Workspace:", data["team"])
    print("User:", data["user"])
  else:
    print("Invalid token")
    print("Error:", data["error"])


# Create and env var named 'YOUR_ACCESS_TOKEN' with your actual Slack access token
slack_access_token = os.environ['SLACK_ACCESS_TOKEN']
test_slack_token(slack_access_token)
