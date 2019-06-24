FROM node:7
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD node /app/src/index.js
EXPOSE 3001
