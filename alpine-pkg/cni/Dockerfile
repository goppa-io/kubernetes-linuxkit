FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

ENV CNI_VERSION="v0.6.0"

RUN wget "https://github.com/containernetworking/cni/releases/download/$CNI_VERSION/cni-amd64-$CNI_VERSION.tgz" && tar -xvf cni-amd64-$CNI_VERSION.tgz  

RUN wget "https://github.com/containernetworking/plugins/releases/download/$CNI_VERSION/cni-plugins-amd64-$CNI_VERSION.tgz" && tar -xvf cni-plugins-amd64-$CNI_VERSION.tgz


FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /cnitool /opt/cni/bin/
COPY --from=mirror /noop /opt/cni/bin/
COPY --from=mirror /flannel /opt/cni/bin/
COPY --from=mirror /ptp /opt/cni/bin/
COPY --from=mirror /host-local /opt/cni/bin/
COPY --from=mirror /portmap /opt/cni/bin/
COPY --from=mirror /tuning /opt/cni/bin/
COPY --from=mirror /sample /opt/cni/bin/
COPY --from=mirror /dhcp /opt/cni/bin/
COPY --from=mirror /ipvlan /opt/cni/bin/
COPY --from=mirror /macvlan /opt/cni/bin/
COPY --from=mirror /loopback /opt/cni/bin/
COPY --from=mirror /bridge /opt/cni/bin/
