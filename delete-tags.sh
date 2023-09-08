#!/bin/bash

set -e

git tag -d $(git tag -l | grep "rc")
git fetch origin --tags
git push origin --delete $(git tag -l | grep "rc")  || :

