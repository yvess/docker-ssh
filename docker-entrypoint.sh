#!/bin/bash
set -e

if [ "$1" = 'sshserver' ]; then
  # SETUP
  mkdir -p /root/.ssh /var/run/sshd
  cp /root/id.pub /root/.ssh/authorized_keys

  # RUN sshd
  echo "* started sshd"
  exec /usr/sbin/sshd -D
fi
exec "$@"
