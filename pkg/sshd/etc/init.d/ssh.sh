#!/bin/sh

exec /usr/sbin/sshd -e -f /etc/ssh/sshd_config -dD > /var/log/sshd.log 2>&1 &
