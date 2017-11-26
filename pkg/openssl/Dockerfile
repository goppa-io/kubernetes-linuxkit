FROM linuxkit/alpine:07f7d136e427dc68154cd5edbb2b9576f9ac5213 as alpine

RUN apk add openssl

FROM scratch 
ENTRYPOINT []
WORKDIR /
COPY --from=alpine /usr/bin/openssl /usr/bin/
COPY --from=alpine /etc/ssl/ /etc/ssl/
