FROM node:lts-alpine

WORKDIR /app

RUN npm install -g bittorrent-tracker

EXPOSE 1337

ENTRYPOINT ["bittorrent-tracker", "--port", "1337", "--ws"]
