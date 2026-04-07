#!/bin/sh
set -e

postconf -e "myhostname=${MYHOSTNAME:-mail.local}"

postmap /etc/postfix/sasl_passwd
postmap /etc/postfix/allowed_domains
postmap /etc/postfix/allowed_senders

find /etc/postfix -maxdepth 1 \( -name 'sasl_passwd*' -o -name 'allowed_domains*' -o -name 'allowed_senders*' \) -exec chmod 600 {} \;

exec postfix start-fg