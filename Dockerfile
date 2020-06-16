FROM minio/mc:RELEASE.2020-02-05T20-07-22Z

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]