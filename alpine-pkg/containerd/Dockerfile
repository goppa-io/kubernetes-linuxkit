FROM alpine:3.7 AS mirror

# update base image
RUN apk update && apk upgrade -a

# add Go validation tools
COPY go-compile.sh /go/bin/
COPY etc/containerd/config.toml /etc/containerd/config.toml
RUN apk add --no-cache git go musl-dev
ENV GOPATH=/go PATH=$PATH:/go/bin
RUN go get -u github.com/golang/lint/golint
RUN go get -u github.com/gordonklaus/ineffassign
RUN go get -u github.com/LK4D4/vndr

# checkout and compile containerd
# Update `FROM` in `pkg/containerd/Dockerfile`, `pkg/init/Dockerfile` and
# `test/pkg/containerd/Dockerfile` when changing this.
ENV CONTAINERD_REPO=https://github.com/containerd/containerd.git
ENV CONTAINERD_COMMIT=89623f28b87a6004d4b785663257362d1658a729
RUN mkdir -p $GOPATH/src/github.com/containerd && \
  cd $GOPATH/src/github.com/containerd && \
  git clone https://github.com/containerd/containerd.git && \
  cd $GOPATH/src/github.com/containerd/containerd && \
  git checkout $CONTAINERD_COMMIT
RUN apk add --no-cache btrfs-progs-dev gcc libc-dev linux-headers make
RUN cd $GOPATH/src/github.com/containerd/containerd && \
  make binaries EXTRA_FLAGS="-buildmode pie" EXTRA_LDFLAGS='-extldflags "-fno-PIC -static"' BUILD_TAGS="static_build"


FROM scratch

COPY --from=mirror /go/src/github.com/containerd/containerd/bin/containerd /go/src/github.com/containerd/containerd/bin/ctr /go/src/github.com/containerd/containerd/bin/containerd-shim /usr/bin/
COPY --from=mirror /etc/containerd/config.toml /etc/containerd/
