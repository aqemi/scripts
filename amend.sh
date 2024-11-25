#!/bin/bash

set -e

git commit -a --amend --no-edit --no-verify --reset-author
git push --force-with-lease --no-verify 
git fetch