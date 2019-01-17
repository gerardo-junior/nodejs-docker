ARG NODE_VERSION="8.15.0"

FROM library/node:$NODE_VERSION-alpine

LABEL maintainer="Gerardo Junior <me@gerardo-junior.com>"
LABEL url="https://github.com/gerardo-junior/nodejs-docker.git"

ENV USER "node"
ENV WORKDIR "/src"

# Create project directory
RUN mkdir -p $WORKDIR

# Empowering user with sudo
RUN set -xe && \
    #addgroup -g 1000 $USER && \
    #adduser -u 1000 -G $USER -s /bin/sh -D $USER && \
    apk --update add --virtual .persistent-deps sudo && \
    echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default && \
    chown -Rf $USER $WORKDIR

COPY ./tools /opt/tools
RUN chmod -R +x /opt/tools/

# Set project directory
VOLUME [$WORKDIR}]
WORKDIR $WORKDIR
USER $USER
ENTRYPOINT ["/bin/sh", "/opt/tools/entrypoint.sh"]