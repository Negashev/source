#!/bin/sh

mc config host add minio http://lb.minio.rancher.internal minio minio123 S3v4
exec "$@"
