#!/bin/bash

set -e

PLUGIN_TXT=${PLUGIN_TXT:-/usr/share/elasticsearch/plugins.txt}

while [ ! -f "/usr/share/elasticsearch/config/elasticsearch.yml" ]; do
    sleep 1
done

if [ -f "$PLUGIN_TXT" ]; then
    for plugin in `cat "$PLUGIN_TXT"`
    do
        /usr/share/elasticsearch/bin/plugin install $plugin || true
    done
fi

KOPF_REFRESH_RATE="${KOPF_REFRESH_RATE:-5000}"
KOPF_THEME="${KOPF_THEME:-dark}"
KOPF_WITH_CREDENTIALS="${KOPF_WITH_CREDENTIALS:-false}"

cat <<EOF > /usr/share/elasticsearch/plugins/kopf/_site/kopf_external_settings.json
{
    "elasticsearch_root_path": "/es",
    "with_credentials": ${KOPF_WITH_CREDENTIALS},
    "theme": "${KOPF_THEME}",
    "refresh_rate": ${KOPF_REFRESH_RATE}
}
EOF

exec /docker-entrypoint.sh elasticsearch
