#!/bin/bash
# This script force cleans the current git repository.
# It deletes all local tags and branches except master, removes untracked files,
# clears the stash, expires reflog, and runs aggressive garbage collection.
# Usage: ./clean.sh
set -exv

git tag -d $(git tag)
git fetch --prune --tags
git clean -fdx
git checkout master
git pull
git branch | grep -v "master" | xargs git branch -D 
git stash clear
git reflog expire --all --expire=now
git gc --prune=now --aggressive