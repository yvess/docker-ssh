#!/bin/sh
set -e

if [ "$1" = 'sshserver' ]; then
  # SETUP
  mkdir -p /root/.ssh /var/run/sshd
  if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
    ssh-keygen -A
  fi
  if [ -f "/root/id_rsa.pub" ]; then
    cp /root/id_rsa.pub /root/.ssh/authorized_keys
  fi
  if [ -f "/root/id_dsa.pub" ]; then
    cp /root/id_dsa.pub /root/.ssh/authorized_keys
  fi

  # RUN sshd
  echo "* started sshd"
  exec /usr/sbin/sshd -D
fi
exec "$@"
