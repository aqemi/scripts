#!/bin/bash
# This script updates the remote origin URL for all git repositories in subdirectories.
# Usage: Set FROM and TO variables to the old and new remote URL patterns.
set -eo pipefail
repos=$(ls -d ./*/)

FROM=xxx
TO=xxx

for repo in $repos; do
  [[ ! -d "$repo" ]] && continue
  cd "$repo"
  origin=$(git config --get remote.origin.url || :)
  echo "Current - $origin"
  if [[ "$origin" =~ $FROM ]]; then
    newRemote=$(echo $origin | sed  "s|$FROM|$TO|g")
    git remote set-url origin "$newRemote"
    echo "Changed to $newRemote"
  fi
  cd -
done
