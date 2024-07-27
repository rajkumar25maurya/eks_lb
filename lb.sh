#!/bin/bash
#kubectl get ingress  -n dev-genie-ns  | awk '{print $4}' | tail -n1
set -e
ingress_address=`kubectl get ingress  -n dev-genie-ns  | awk '{print $4}' | tail -n1`
jq -n --arg foobaz "$ingress_address" '{"extvar":$foobaz}'
