#!/usr/bin/env bash

set -e

if [ -n "$AWS_S3_ENDPOINT" ] && [ -n "$AWS_APIGW_ENDPOINT" ] && [ -n "$AWS_REGION" ] && [ -n "$JWT_ISSUER" ] && [ -n "$JWT_CLIENT" ]&& [ -n "$JWT_JWK_URI" ] && [ -n "$JWT_ISSUER_HOST" ]; then
  eval "cat <<< \"$(cat /etc/envoy/envoy.tmpl)\"" > /etc/envoy/envoy.yaml
else
  echo "AWS_S3_ENDPOINT, AWS_APIGW_ENDPOINT AWS_REGION JWT_ISSUER JWT_JWK_URI JWT_ISSUER_HOST JWT_CLIENT are not defined."
  exit -1
fi

exec /docker-entrypoint.sh "${@}"
