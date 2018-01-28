FROM linuxkit/alpine:07f7d136e427dc68154cd5edbb2b9576f9ac5213 as alpine

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/

RUN apk add --no-cache --initdb -p /out \
    openssl

FROM scratch 
ENTRYPOINT []
WORKDIR /
COPY --from=build /out /
