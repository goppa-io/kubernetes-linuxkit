FROM golang:stretch

RUN go get -u github.com/moby/tool/cmd/moby

RUN go get -u github.com/linuxkit/linuxkit/src/cmd/linuxkit

WORKDIR /linuxkit

CMD ["/bin/bash"]
