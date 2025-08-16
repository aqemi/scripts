#!/bin/bash
# This script squashes all commits on the current branch into a single commit on top of the specified base branch.
# Usage: ./squash.sh [base-branch]
# Example: ./squash.sh develop
# If no base branch is specified, it defaults to 'master'.
set -e

base=${1:-master}
git fetch origin $base:$base
git reset "$(git merge-base "$base" $(git rev-parse --abbrev-ref HEAD))"
git add -A
