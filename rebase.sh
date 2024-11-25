#!/bin/bash

branch=${1:-master}

git fetch
git rebase "origin/$branch"
git push --force-with-lease