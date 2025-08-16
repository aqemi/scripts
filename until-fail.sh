#!/bin/bash
# This script repeatedly runs a given command until it fails (returns non-zero).
# Usage: ./until-fail.sh <command> [args...]
# Example: ./until-fail.sh curl -f https://example.com
# The script will stop when the command exits with a non-zero status.
:"${*?:"Usage: until-fail.sh <command>"}"
while "$@"; do :; done