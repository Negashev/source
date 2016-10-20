gitlab-runner register --non-interactive --url "$CI_SERVER_URL" --registration-token "$REGISTRATION_TOKEN" "$@"
/usr/bin/dumb-init /entrypoint run --user=gitlab-runner --working-directory=/home/gitlab-runner
