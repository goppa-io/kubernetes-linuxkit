FROM debian:stretch


COPY etc/apt/sources.list /etc/apt/sources.list
RUN apt update && apt-get -t testing install -y openrc 
RUN apt update && apt-get install -y klibc-utils file util-linux rsync busybox 
RUN for file in /etc/rc0.d/K*; do s=`basename $(readlink "$file")` ; /etc/init.d/$s stop; done
RUN apt install -y openssh-server && apt remove -y systemd && apt autoremove -y
RUN rm -rf /etc/rc* && rm -rf /etc/init.d/*
COPY . ./
RUN mkdir -p /etc/ssh /root/.ssh && chmod 0700 /root/.ssh
RUN ssh-keygen -A >/dev/null 2>/dev/null

