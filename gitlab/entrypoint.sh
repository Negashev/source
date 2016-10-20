gitlab-runner register --non-interactive --url "$CI_SERVER_URL" --registration-token "$CI_SERVER_URL" "$@"
/usr/bin/dumb-init /entrypoint run --user=gitlab-runner --working-directory=/home/gitlab-runner
