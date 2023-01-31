FROM alpine:latest
RUN apk update && apk --no-cache add ca-certificates \
    && update-ca-certificates

RUN echo '@edge https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
    && apk upgrade \
    && apk -v add tor@edge \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN adduser -u 1001 -h /torrunner -D -s /bin/ash torrunner \ 
    && mkdir -p /torrunner && chmod 700 /torrunner \ 
    && chown 1001:1001 -R /torrunner

USER torrunner
CMD tor -f /etc/tor/torrc