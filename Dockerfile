FROM ubuntu:latest AS base
LABEL maintainer="Paavan <paavan@protonmail.com>"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
	&& apt install -y --no-install-recommends \
    wget \
    curl \
    cmake \
    make \
    build-essential \
    libyaml-0-2 \
    ca-certificates \
    ncat \
    git

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /ecs-fargate-pv1.4-falco
RUN /ecs-fargate-pv1.4-falco/bin/build
CMD ["/ecs-fargate-pv1.4-falco/bin/falco"]
