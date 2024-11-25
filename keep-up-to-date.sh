#!/bin/bash

set -eo pipefail

target_branch=${1?:"Usage: keep-up-to-date.sh <target branch> [base branch]"}
base_branch=${2:-$(git rev-parse --abbrev-ref HEAD)}
git checkout "$target_branch"
git pull
git rebase "$base_branch"
git push --force-with-lease
git checkout -