FROM debian:stretch


COPY etc/apt/sources.list /etc/apt/sources.list
RUN apt update && apt-get -t testing install -y openrc 
RUN apt update && apt-get install -y klibc-utils file util-linux
RUN for file in /etc/rc0.d/K*; do s=`basename $(readlink "$file")` ; /etc/init.d/$s stop; done
COPY . ./
