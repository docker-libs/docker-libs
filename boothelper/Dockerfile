ARG JAVA_VER=8u342-slim-bullseye
FROM openjdk:${JAVA_VER}
LABEL maintainer="MAINTAINER sorc@qq.com"
ARG FULL_VERSION=8u342-slim-bullseye-20251231
ENV TZ=Asia/Shanghai RUNCMD= RUNARGS= VERSION=${FULL_VERSION}
ADD files/ /
RUN chmod +x /docker-entrypoint.sh && \
    mkdir -p ~/.config/pip && \
    echo "[global]" > ~/.config/pip/pip.conf && \
    echo "break-system-packages = true" >> ~/.config/pip/pip.conf && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
RUN apt update && \
    apt -y -f install curl wget telnet python3 python3-pip dnsutils traceroute inetutils-ping net-tools \
    openssh-client iproute2 sysstat tcpdump mtr-tiny netcat-openbsd nmap
RUN pip install -r /app/requirements.txt
WORKDIR /app
VOLUME /app
CMD ["/docker-entrypoint.sh"]

