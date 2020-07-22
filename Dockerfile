FROM ubuntu:latest

RUN apt-get update && \
  apt-get dist-upgrade -uyf && \
  apt-get install -yq curl xz-utils
ARG WATCHEXEC_VERSION=1.14.0
RUN curl -OLs https://github.com/watchexec/watchexec/releases/download/${WATCHEXEC_VERSION}/watchexec-${WATCHEXEC_VERSION}-x86_64-unknown-linux-gnu.tar.xz && \
  tar xf watchexec-${WATCHEXEC_VERSION}-x86_64-unknown-linux-gnu.tar.xz && \
  mv watchexec-${WATCHEXEC_VERSION}-x86_64-unknown-linux-gnu/watchexec /bin/ && \
  rm -fr watchexec-${WATCHEXEC_VERSION}-x86_64-unknown-linux-gnu*
RUN apt-get remove -yf xz-utils curl && apt-get autoremove  -y
