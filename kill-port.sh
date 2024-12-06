#!/bin/bash

set -eo pipefail

kill -9 "$(lsof -i:"$1" -t)"
