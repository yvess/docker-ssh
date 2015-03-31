FROM alpine:3.1
MAINTAINER Yves Serrano <y@yas.ch>

RUN apk add --update openssh && \
    rm -rf /var/cache/apk/*
ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sshserver"]
EXPOSE 22
