FROM minio/mc:RELEASE.2020-05-28T23-43-36Z

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]