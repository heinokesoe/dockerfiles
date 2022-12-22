FROM docker.io/golang:alpine as build
WORKDIR /data
RUN apk add --no-cache --update git \
    && git clone https://github.com/muety/telepush \
    && cd telepush && go build -o telepush .

FROM alpine
WORKDIR /app
COPY --from=build /data/telepush/telepush telepush
COPY --from=build /data/telepush/views views
COPY entrypoint.sh /entrypoint.sh
VOLUME /srv/data
EXPOSE 8080
ENTRYPOINT [ "/entrypoint.sh" ]
