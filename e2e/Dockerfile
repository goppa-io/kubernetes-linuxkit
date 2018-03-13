FROM golang:alpine



RUN apk update && apk add git

RUN git clone https://github.com/kubernetes/kubernetes.git /kubernetes

RUN apk update && apk add rsync make bash grep coreutils findutils gcc musl-dev linux-headers

RUN cd /kubernetes && git checkout tags/v1.9.1

RUN cd /kubernetes && make WHAT=test/e2e/e2e.test && make WHAT=cmd/kubectl

RUN go get github.com/onsi/ginkgo/ginkgo

RUN cp /go/bin/ginkgo /kubernetes/_output/bin

RUN cp -a /kubernetes/_output/bin/* /

RUN rm -rf /kubernetes/
