FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/
RUN apk add --no-cache --initdb -p /out \
    socat

RUN mv /out/etc/apk/repositories.upstream /out/etc/apk/repositories

FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /out/ /

