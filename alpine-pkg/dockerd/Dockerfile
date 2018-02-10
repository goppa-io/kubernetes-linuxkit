FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

ENV DOCKER_VERSION="18.02.0-ce"

RUN wget "https://download.docker.com/linux/static/edge/x86_64/docker-$DOCKER_VERSION.tgz" && tar -xvf docker-18.02.0-ce.tgz 

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/

RUN apk add --no-cache --initdb -p /out \
    btrfs-progs \
    e2fsprogs \
    e2fsprogs-extra \
    iptables \
    xfsprogs \
    xz

RUN mv /out/etc/apk/repositories.upstream /out/etc/apk/repositories


FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /out/ /
COPY --from=mirror /docker/dockerd /usr/bin/dockerd
COPY --from=mirror /docker/docker /usr/bin/docker
COPY --from=mirror /docker/docker-init /usr/bin/docker-init
COPY . ./
