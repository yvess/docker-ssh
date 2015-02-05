#!/bin/bash
set -e

if [ "$1" = 'sshserver' ]; then
  # SETUP
  mkdir -p /root/.ssh /var/run/sshd

  # RUN sshd
  exec /usr/sbin/sshd -D
fi
exec "$@"
