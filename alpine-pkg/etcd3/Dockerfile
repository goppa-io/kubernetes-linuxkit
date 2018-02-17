FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

ENV ETCD_VERSION=v3.1.11

RUN wget https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -O etcd.tar.gz && \
    tar xzf etcd.tar.gz && \
    mkdir /out && \
    cp /etcd-$ETCD_VERSION-linux-amd64/etcd /out/etcd && \
    cp /etcd-$ETCD_VERSION-linux-amd64/etcdctl /out/etcdctl 


FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /out/etcd /usr/bin/etcd
COPY --from=mirror /out/etcdctl /usr/bin/etcdctl
