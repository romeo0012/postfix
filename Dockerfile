FROM alpine:latest

RUN apk add --no-cache \
    postfix \
    cyrus-sasl \
    cyrus-sasl-login \
    ca-certificates \
    mailx \
    bash

RUN mkdir -p /var/spool/postfix /etc/postfix/maps

COPY main.cf /etc/postfix/main.cf
COPY sasl_passwd /etc/postfix/sasl_passwd
COPY allowed_domains /etc/postfix/allowed_domains
COPY allowed_senders /etc/postfix/allowed_senders
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

EXPOSE 25

ENTRYPOINT ["/docker-entrypoint.sh"]