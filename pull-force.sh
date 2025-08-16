#!/bin/bash
# This script forcefully pulls the latest changes from the remote repository,
# overwriting any local changes. Use with caution, as local modifications
# will be lost.
set -eo pipefail

upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})

git fetch --all --tags
git reset --hard "$upstream"