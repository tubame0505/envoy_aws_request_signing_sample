#!/usr/bin/env bash

set -e

if [ -n "$AWS_S3_ENDPOINT" ] && [ -n "$AWS_APIGW_ENDPOINT" ] && [ -n "$AWS_REGION" ]; then
  eval "cat <<< \"$(cat /etc/envoy/envoy.tmpl)\"" > /etc/envoy/envoy.yaml
else
  echo "AWS_S3_ENDPOINT, AWS_APIGW_ENDPOINT AWS_REGION are not defined."
  exit -1
fi

exec /docker-entrypoint.sh "${@}"
