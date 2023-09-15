# Slack scripts

## Slack Token Tester

[slack_token_test.sh](slack_token_test.sh) This Python script is designed to test the validity of a Slack access token by making an API call to Slack's auth.test endpoint. It checks if the token is valid and provides information about the associated workspace and user.

By design the “Auto-cancel redundant builds functionality does not apply to the project’s default branch.
This solution is based on [this workaround](https://discuss.circleci.com/t/workaround-auto-cancel-redundant-builds-on-the-default-branch/39468).

Dependencies:

- SLACK_ACCESS_TOKEN: Create an environment variable named SLACK_ACCESS_TOKEN and set it to your actual Slack access token.
- Python 3 installed.
- The requests library, which you can install using pip

Example:

```
python slack_token_test.py
```
