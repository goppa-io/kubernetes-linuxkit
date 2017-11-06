FROM golang:stretch

RUN git clone https://github.com/linuxkit/linuxkit /linuxkit

WORKDIR /linuxkit

RUN make && make install

CMD ["/bin/bash"]
