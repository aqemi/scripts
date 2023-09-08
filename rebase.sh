#!/bin/bash

branch=${1:-master}

git fetch
git rebase "origin/$branch"
git push -f