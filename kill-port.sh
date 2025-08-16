#!/bin/bash
# This script kills the process running on a specified port.
# Usage: ./kill-port.sh <port>
# Example: ./kill-port.sh 3000
set -eo pipefail

kill -9 $(lsof -i:"$1" -t)
