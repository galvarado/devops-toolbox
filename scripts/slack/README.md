# Slack scripts

## Slack Token Tester

[check_token.sh](check_token.sh) This Python script is designed to test the validity of a Slack access token by making an API call to Slack's auth.test endpoint. It checks if the token is valid and provides information about the associated workspace and user.

Dependencies:

- SLACK_ACCESS_TOKEN: Create an environment variable named SLACK_ACCESS_TOKEN and set it to your actual Slack access token.
- Python 3 installed.
- The requests library, which you can install using pip

Example:

```
python slack_token_test.py
```
