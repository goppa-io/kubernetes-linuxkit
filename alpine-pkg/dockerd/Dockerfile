FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

ENV DOCKER_VERSION="17.12.0-ce"


RUN wget "https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz" && tar -xvf docker-17.12.0-ce.tgz 

FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /docker/dockerd /usr/bin/dockerd
COPY --from=mirror /docker/docker /usr/bin/docker
COPY --from=mirror /docker/docker-init /usr/bin/docker-init
COPY . ./
