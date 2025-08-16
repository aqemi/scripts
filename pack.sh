#!/bin/bash
# This script packs the current npm package, removes any existing .tgz files,
# installs the packed tarball into the specified directory, and passes any additional arguments to npm install.
# Usage: ./npm-pack.sh <target-directory> [additional npm install args]
# Example: ./npm-pack.sh ../my-app --save-dev

set -eo pipefail

rm -f *.tgz
npm pack
tar_file=$(ls *.tgz | head -n 1)
tar_abs_path=$(realpath "$tar_file")
echo "found $abs_path"

(
  cd "$1" || exit 2
  echo "working in $PWD"
  npm install "$tar_abs_path" "${@:2}"
)