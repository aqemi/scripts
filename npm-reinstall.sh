#!/bin/bash
# This script removes node_modules and package-lock.json, then reinstalls dependencies.
# Usage: ./npm-reinstall.sh [npm install options]
# Example: ./npm-reinstall.sh --legacy-peer-deps
set -eo pipefail

rm -rf node_modules package-lock.json
npm install $@