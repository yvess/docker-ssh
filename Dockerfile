FROM ubuntu:14.04
MAINTAINER Yves Serrano <y@yas.ch>

RUN apt-get update -yq && apt-get install -yq openssh-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sshserver"]
EXPOSE 22
