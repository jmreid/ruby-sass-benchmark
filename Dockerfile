FROM ruby:2.7.2

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8

# Install required packages
RUN apt-get update; \
  apt-get install -y -qq \
  curl \
  gcc \
  git \
  make

WORKDIR /app

RUN wget https://github.com/sharkdp/hyperfine/releases/download/v1.11.0/hyperfine_1.11.0_amd64.deb && \
  dpkg -i hyperfine_1.11.0_amd64.deb && \
  rm hyperfine_1.11.0_amd64.deb

RUN gem install sass

COPY theme.scss .
COPY benchmark.sh .
