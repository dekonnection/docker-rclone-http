FROM alpine:latest
LABEL maintainer="dek@iono.me"

ENV PORT=8080 \
    LOGLEVEL='NOTICE'

EXPOSE ${PORT}/tcp

RUN apk update &&\
    apk add curl ca-certificates &&\
    cd /tmp &&\
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip &&\
    unzip rclone-current-linux-amd64.zip &&\
    cp rclone-*-linux-amd64/rclone /usr/bin &&\
    chmod 755 /usr/bin/rclone &&\
    adduser -D rclone &&\
    apk del curl &&\
    rm -rf /var/cache/apk

COPY --chown=rclone:rclone entrypoint.sh /rclone_start.sh
USER rclone
ENTRYPOINT ["/rclone_start.sh"]
