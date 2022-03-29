#!/usr/bin/env bash

set -e

if [ -n "$AWS_S3_ENDPOINT" ] && [ -n "$AWS_APIGW_ENDPOINT" ] && [ -n "$AWS_REGION" ]; then
  sed -e "s/\${AWS_APIGW_ENDPOINT}/${AWS_APIGW_ENDPOINT}/g" /etc/envoy/envoy.tmpl | sed -e "s/\${AWS_S3_ENDPOINT}/${AWS_S3_ENDPOINT}/g" | sed -e "s/\${AWS_REGION}/${AWS_REGION}/g" > /etc/envoy/envoy.yaml
else
  echo "AWS_S3_ENDPOINT, AWS_APIGW_ENDPOINT are not defined."
  exit -1
fi

exec /docker-entrypoint.sh "${@}"
