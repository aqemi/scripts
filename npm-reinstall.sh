#!/bin/bash

set -eo pipefail

rm -rf node_modules package-lock.json
npm install $@