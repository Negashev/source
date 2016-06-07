#!/bin/sh

set -e

if [ ! -z "${KOPF_BASIC_AUTH_LOGIN}" ]; then
    echo "${KOPF_BASIC_AUTH_LOGIN}:${KOPF_BASIC_AUTH_PASSWORD}" > /etc/nginx/kopf.htpasswd
fi

exec nginx
