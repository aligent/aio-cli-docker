FROM node:18.16-alpine3.16

RUN mkdir /app /aio /home/node/.config /home/node/.cache
RUN chown node:node /app /aio /home/node/.config  /home/node/.cache

RUN apk update && \
    apk add \
      sudo bash less shadow docker && \
    rm -rf /var/cache/apk/*

USER node
WORKDIR /aio

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin:/aio/node_modules/@adobe/aio-cli/bin/

COPY --chown=node:node package.json ./
COPY --chown=node:node package-lock.json ./

RUN npm ci

RUN ln /aio/node_modules/@adobe/aio-cli/bin/run /aio/node_modules/@adobe/aio-cli/bin/aio
RUN aio --version

WORKDIR /app
USER root

COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
