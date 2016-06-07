#!/bin/sh
if [ ! -z "${KOPF_BASIC_AUTH_LOGIN}" ]; then
    echo "${KOPF_BASIC_AUTH_LOGIN}:${KOPF_BASIC_AUTH_PASSWORD}" > /etc/nginx/conf.d/kopf.htpasswd
fi
