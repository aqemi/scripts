#!/bin/bash

set -eo pipefail

#!/bin/bash

# Define the old and new usernames
OLD_NAME="root"
OLD_EMAIL="root@example.org"
NEW_NAME="aqemi"
NEW_EMAIL="2773683+aqemi@users.noreply.github.com"

remote=$(git remote get-url origin)
echo "remote is $remote"

# Rewrite history using git filter-repo
git filter-repo --commit-callback '
if commit.author_name == b"'"$OLD_NAME"'":
    commit.author_name = b"'"$NEW_NAME"'"
if commit.committer_name == b"'"$OLD_NAME"'":
    commit.committer_name = b"'"$NEW_NAME"'"
if commit.author_email == b"'"$OLD_EMAIL"'":
    commit.author_email = b"'"$NEW_EMAIL"'"
if commit.committer_email == b"'"$OLD_EMAIL"'":
    commit.committer_email = b"'"$NEW_EMAIL"'"
'

git log --format='%an <%ae>%n%cn <%ce>' | sort | uniq

git remote add origin "$remote"