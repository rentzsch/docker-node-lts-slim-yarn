FROM node:6.10.1-slim

RUN apt-get update && \
  apt-get install -y apt-transport-https && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -y yarn=0.21.3-1 && \
  apt-get remove --purge -y apt-transport-https $(apt-mark showauto) && \
  rm /etc/apt/sources.list.d/yarn.list && \
  rm -rf /var/lib/apt/lists/*
