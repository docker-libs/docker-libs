# syntax = docker/dockerfile:experimental
ARG VER
FROM debian:${VER}
LABEL author=sorc@sction.org
ARG TARGETOS
ARG TARGETARCH
ENV TZ=Asia/Shanghai
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN apt-get update && \
    apt-get -y install curl wget telnet openssh-client inetutils-ping iproute2 dnsutils traceroute net-tools sysstat tcpdump mtr-tiny nmap && \
    update-ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /docker-entrypoint.sh
RUN curl -L \
    --fail \
    --show-error \
    --progress-bar \
    --location \
    --output /tmp/wstunnel.tar.gz \
    "https://github.com/erebe/wstunnel/releases/download/v10.5.0/wstunnel_10.5.0_linux_${TARGETARCH}.tar.gz" && \
    mkdir /tmp/wstunnel/ && \
    tar zxf /tmp/wstunnel.tar.gz -C /tmp/wstunnel/ && \
    cp -R /tmp/wstunnel/wstunnel /usr/bin/wst && \
    chmod +x /usr/bin/wst && \
    rm -rf /tmp/wstunnel*
CMD ["/docker-entrypoint.sh"]
