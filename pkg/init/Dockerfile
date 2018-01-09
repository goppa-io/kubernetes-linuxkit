FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/
RUN apk add --no-cache --initdb -p /out \
util-linux

# Use sha256 here to get a fixed version
FROM alpine:edge@sha256:99588bc8883c955c157d18fc3eaa4a3c1400c223e6c7cabca5f600a3e9f8d5cd
ENTRYPOINT []
CMD []
WORKDIR /
COPY --from=mirror /out /
COPY . ./
