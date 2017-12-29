FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/
RUN apk add --no-cache --initdb -p /out \
    alpine-baselayout \
    apk-tools \
    busybox \
    musl \
    openssh-server \
    util-linux \
    # Install Docker Packages
    btrfs-progs \
    e2fsprogs \
    e2fsprogs-extra \
    iptables \
    xfsprogs \
    xz
RUN mv /out/etc/apk/repositories.upstream /out/etc/apk/repositories

#Add Docker Users
RUN  addgroup docker


FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /out/ /
COPY etc/ /etc/
RUN mkdir -p /etc/ssh /root/.ssh && chmod 0700 /root/.ssh
RUN ssh-keygen -A >/dev/null 2>/dev/null
# Remove Openrc inittab
RUN rm /etc/inittab

