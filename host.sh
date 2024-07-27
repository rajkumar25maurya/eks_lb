#!/bin/bash
#kubectl get ingress  -n dev-genie-ns  | awk '{print $4}' | tail -n1
set -e
host_name=`kubectl get ingress  -n dev-genie-ns  | awk '{print $3}' | tail -n1`
 jq -n --arg host "$host_name" '{"host":$host}'
 
