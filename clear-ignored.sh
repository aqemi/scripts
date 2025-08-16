#!/bin/bash
# This script removes all files from the git index and re-adds them,
# effectively clearing out ignored files from the index.
# Usage: ./clear-ignored.sh
set -e

git rm -r --cached .
git add .
