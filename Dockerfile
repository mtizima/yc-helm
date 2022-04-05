FROM alpine:3.15.4

ENV VERSION v3.4.0

MAINTAINER Mitya Grebenshchikov <mtizima@gmail.com>

WORKDIR /

# Enable SSL
# Helm plugins require git
# helm-diff and yandex-cloud requires bash, curl
RUN apk --update add ca-certificates wget python3 curl tar jq git bash

ENV HOME /
ENV PATH /yandex-cloud/bin:$PATH

# Install Yandex Cli
RUN curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash

# Install Helm
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz
ENV HELM_URL https://get.helm.sh/${FILENAME}

RUN echo $HELM_URL

RUN curl -o /tmp/$FILENAME ${HELM_URL} \
  && tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp

# Install envsubst [better than using 'sed' for yaml substitutions]
ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

# Install Helm plugins
# workaround for an issue in updating the binary of `helm-diff`
ENV HELM_PLUGIN_DIR /.helm/plugins/helm-diff
# Plugin is downloaded to /tmp, which must exist
RUN mkdir /tmp
RUN helm plugin install https://github.com/viglesiasce/helm-gcs.git
RUN helm plugin install https://github.com/databus23/helm-diff
RUN helm plugin install https://github.com/helm/helm-2to3