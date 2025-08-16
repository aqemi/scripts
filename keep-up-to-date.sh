#!/bin/bash
# This script keeps a target branch up to date with a base branch by rebasing and force-pushing.
# Usage: ./keep-up-to-date.sh <target branch> [base branch]
# Example: ./keep-up-to-date.sh feature-branch master
#
# Arguments:
#   <target branch>   The branch you want to update.
#   [base branch]     The branch to rebase onto (default: current branch).
set -eo pipefail

target_branch=${1?:"Usage: keep-up-to-date.sh <target branch> [base branch]"}
base_branch=${2:-$(git rev-parse --abbrev-ref HEAD)}
git checkout "$target_branch"
git pull
git rebase "$base_branch"
git push --force-with-lease
git checkout -