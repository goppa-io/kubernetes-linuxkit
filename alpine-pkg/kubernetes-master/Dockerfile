FROM alpine:latest AS mirror


ENV KUBERNETES_VERSION="v1.9.1"

RUN apk add --update gcc g++ libgcc make musl-dev libc-dev \
  linux-headers libffi-dev git mercurial go go-tools curl rsync bind-tools bash grep findutils coreutils && \
rm -rf /var/cache/apk/*

RUN mkdir -p /go/src && \
  mkdir -p /go/pkg && \
mkdir -p /go/bin

ENV PATH /go/bin:/usr/src/go/bin:$PATH
ENV GOPATH /go
ENV GOLANG_VERSION 1.5.3
WORKDIR /go

RUN go get -d github.com/kubernetes/kubernetes/cmd/kubelet && \
  cd /go/src/github.com/kubernetes/kubernetes && \
  git checkout tags/$KUBERNETES_VERSION && \
  make WHAT='cmd/kubelet'

RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kube-apiserver"
RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kube-controller-manager"
RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kube-proxy"
RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kube-scheduler"

RUN chmod +x /go/kube-apiserver && chmod +x /go/kube-controller-manager && chmod +x /go/kube-proxy && chmod +x /go/kube-scheduler && chmod +x /go/src/github.com/kubernetes/kubernetes/_output/local/bin/linux/amd64/kubelet


FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /go/src/github.com/kubernetes/kubernetes/_output/local/bin/linux/amd64/kubelet /usr/bin/kubelet
COPY --from=mirror /go/kube-apiserver /usr/bin/kube-apiserver
COPY --from=mirror /go/kube-controller-manager /usr/bin/kube-controller-manager
COPY --from=mirror /go/kube-proxy /usr/bin/kube-proxy
COPY --from=mirror /go/kube-scheduler /usr/bin/kube-scheduler

