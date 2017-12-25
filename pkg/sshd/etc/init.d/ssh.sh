#!/bin/sh

KEYS=$(find /etc/ssh -name 'ssh_host_*_key')
[ -z "$KEYS" ] && ssh-keygen -A >/dev/null 2>/dev/null

exec /usr/sbin/sshd -e -f /etc/ssh/sshd_config
