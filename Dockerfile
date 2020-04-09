FROM ubuntu:18.04

ARG GO_VERSION=1.11.2
ARG ORCHENT_VERSION=1.2.2
ARG OIDC_AGENT_VERSION=v2.0.3

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	apt-get install -y --no-install-recommends \
		curl \
		git \
		ca-certificates \
		libcurl4-openssl-dev \
		libsodium-dev \
		help2man \
		libseccomp-dev \
		libmicrohttpd-dev \
		gcc \
		make \
		xdg-utils \
		lynx \
		openssh-server \
		sshpass

WORKDIR /srv

ENV LANG C.UTF-8

# GO for orchent
RUN curl https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz --output go${GO_VERSION}.linux-amd64.tar.gz && \
	ls && \
	tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
	rm go${GO_VERSION}.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

# orchent
RUN git clone --branch ${ORCHENT_VERSION} https://github.com/indigo-dc/orchent.git && \
	cd orchent/utils && \
	./compile.sh

# oidc-agent
RUN git clone --branch ${OIDC_AGENT_VERSION} https://github.com/indigo-dc/oidc-agent.git && \
	cd oidc-agent && \
	make && \
	make install

ENV PATH="/srv/orchent/utils:${PATH}"
