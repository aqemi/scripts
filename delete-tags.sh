#!/bin/bash
# This script deletes all local and remote git tags.
# Usage: ./delete-tags.sh
set -e

git tag -d $(git tag -l)
git fetch origin --tags
git push origin --delete $(git tag -l)  || :
git tag -d $(git tag -l)

