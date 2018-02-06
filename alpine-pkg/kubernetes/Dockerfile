FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

ENV KUBERNETES_VERSION="v1.9.1"

RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kubelet"
RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kube-apiserver"
RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kube-controller-manager"
RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kube-proxy"
RUN wget "https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kube-scheduler"


FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /kubelet /usr/bin/kubelet
COPY --from=mirror /kube-apiserver /usr/bin/kube-apiserver
COPY --from=mirror /kube-controller-manager /usr/bin/kube-controller-manager
COPY --from=mirror /kube-controller-manager /usr/bin/kube-proxy
COPY --from=mirror /kube-controller-manager /usr/bin/kube-scheduler
