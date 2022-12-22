FROM alpine:latest as build
WORKDIR /app
RUN apk add --no-cache --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api \
    && cd telegram-bot-api && mkdir -p build && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. \
    && cmake --build . --target install -j $(nproc) \
    && strip /app/telegram-bot-api/bin/telegram-bot-api

FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache --update openssl libstdc++
COPY --from=build /app/telegram-bot-api/bin/telegram-bot-api /usr/local/bin/telegram-bot-api
COPY entrypoint.sh /entrypoint.sh
EXPOSE 8081 8082
ENTRYPOINT ["/entrypoint.sh"]
