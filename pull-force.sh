#!/bin/bash

set -eo pipefail

upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})

git fetch --all --tags
git reset --hard "$upstream"