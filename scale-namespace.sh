#!/bin/bash

set -e

NAMESPACE=${1?"Usage: $0 NAMESPACE"}
kubectl get deploy -n "$NAMESPACE" -o name | xargs -I % kubectl scale % --replicas=1 -n "$NAMESPACE"
