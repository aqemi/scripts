#!/bin/bash
# This script rebases the current branch onto the specified branch from origin and force-pushes the result.
# Usage: ./rebase.sh [branch]
# Example: ./rebase.sh develop
# If no branch is specified, it defaults to 'master'.
set -eo pipefail
branch=${1:-master}

git fetch
git rebase "origin/$branch"
git push --force-with-lease