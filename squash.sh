#!/bin/bash
set -e

base=${1:-master}
git reset "$(git merge-base "$base" $(git rev-parse --abbrev-ref HEAD))"
git add -A
