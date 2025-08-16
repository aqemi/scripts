#!/bin/bash
# This script amends the latest commit with all staged and unstaged changes,
# resets the author, force-pushes the amended commit, and fetches updates.
# Usage: ./amend.sh
set -e

git commit -a --amend --no-edit --no-verify --reset-author
git push --force-with-lease --no-verify 
git fetch