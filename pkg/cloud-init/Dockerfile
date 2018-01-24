FROM linuxkit/alpine:d307c8a386fa3f32cddda9409b9687e191cdd6f1 AS mirror

COPY respositories /etc/apk/repositories
RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/
RUN apk add --no-cache --initdb -p /out \
    alpine-baselayout \
    apk-tools \
    busybox \
    musl \
    py-cheetah@community \
    py2-jsonpatch@testing \ 
    cloud-init@testing

FROM scratch
ENTRYPOINT []
WORKDIR /
COPY --from=mirror /out/ /
# Remove Openrc inittab
RUN rm /etc/inittab

