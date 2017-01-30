[ -f /etc/gitlab-runner/config.toml ] && echo "exist /etc/gitlab-runner/config.toml" || gitlab-runner register --non-interactive --url "$CI_SERVER_URL" --registration-token "$REGISTRATION_TOKEN" "$@"
echo $REGISTRY > /usr/local/share/ca-certificates/gitlab.crt
/usr/bin/dumb-init /entrypoint run --user=gitlab-runner --working-directory=/home/gitlab-runner
