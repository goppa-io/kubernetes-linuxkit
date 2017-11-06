FROM golang:stretch

RUN curl -sLO https://get.docker.com/builds/Linux/x86_64/docker-17.03.0-ce.tgz && tar -xz -C /tmp -f docker-17.03.0-ce.tgz && mv /tmp/docker/* /usr/bin

RUN go get -u github.com/moby/tool/cmd/moby

RUN go get -u github.com/linuxkit/linuxkit/src/cmd/linuxkit

WORKDIR /linuxkit

CMD ["/bin/bash"]
