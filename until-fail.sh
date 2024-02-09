#!/bin/bash

:"${*?:"Usage: until-fail.sh <command>"}"
while "$@"; do :; done