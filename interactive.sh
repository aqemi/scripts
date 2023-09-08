#!/bin/bash

base=${1:-master}
git stash --include-untracked -m "before rebase"
git fetch
git rebase -i --rebase-merges "$(git merge-base "$base" $(git rev-parse --abbrev-ref HEAD))"
git stash pop
git add .