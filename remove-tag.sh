#!/bin/bash

set -eo pipefail

# Check if at least one argument (tag name) is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <tag1> <tag2> ... <tagN>"
  exit 1
fi

# Loop through each tag name passed as arguments
for tag in "$@"; do
  echo "Removing tag: $tag"
  git tag -d "$tag"
  git push origin --delete "$tag"
done
