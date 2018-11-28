FROM ubuntu:16.04

LABEL maintainer="ysicing"

ENV TZ=Asia/Shanghai

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && apt-get install --no-install-recommends --no-install-suggests -y vim.tiny wget procps curl net-tools ca-certificates unzip apt-transport-https tzdata curl software-properties-common \
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && rm -rf /var/lib/apt/lists/* 
