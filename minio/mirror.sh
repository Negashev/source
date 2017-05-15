#!/bin/sh

mc config host add minio http://${DNS}:9000 minio minio123 S3v4
mc mirror --force --remove --watch /load/ minio/${BUCKET}/${HOSTNAME}
