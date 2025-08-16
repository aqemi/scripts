#!/bin/bash
# This script interactively rebases the current branch onto the specified base (default: master),
# stashes changes before rebasing, and restores them after.
# Usage: ./interactive.sh [base-branch]
set -e
base=${1:-master}
git stash --include-untracked -m "before rebase"
git fetch
git rebase -i --rebase-merges "$(git merge-base "$base" $(git rev-parse --abbrev-ref HEAD))"
git stash pop
git add .