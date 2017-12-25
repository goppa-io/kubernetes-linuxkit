FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/
RUN apk add --no-cache --initdb -p /out \
    alpine-baselayout \
    apk-tools \
    busybox \
    musl \
    openssh-server \
    util-linux 
RUN mv /out/etc/apk/repositories.upstream /out/etc/apk/repositories


FROM scratch
#ENTRYPOINT []
ENTRYPOINT ["/bin/sh", "-c", "sleep 10000"]
WORKDIR /
COPY --from=mirror /out/ /
COPY etc/ /etc/
RUN mkdir -p /etc/ssh /root/.ssh && chmod 0700 /root/.ssh

