#!/bin/bash

set -ex

git tag -d $(git tag)
git fetch --prune --tags
git clean -fdx
git checkout master
git pull
git branch | grep -v "master" | xargs git branch -D 
git stash clear
git reflog expire --all --expire=now
git gc --prune=now --aggressive