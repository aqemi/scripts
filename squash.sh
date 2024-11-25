#!/bin/bash
set -e

base=${1:-master}
git fetch origin $base:$base
git reset "$(git merge-base "$base" $(git rev-parse --abbrev-ref HEAD))"
git add -A
