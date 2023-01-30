FROM alpine AS build
WORKDIR /rclone
RUN apk add --update curl \
    && latest=$(basename $(curl -fs -o/dev/null -w %{redirect_url} https://github.com/rclone/rclone-webui-react/releases/latest)) \
    && curl -LO "https://github.com/rclone/rclone-webui-react/releases/download/${latest}/currentbuild.zip" \
    && unzip currentbuild.zip

FROM rclone/rclone
COPY --from=build /rclone/build rclone
COPY entrypoint.sh /entrypoint.sh
EXPOSE 8000
ENTRYPOINT ["/entrypoint.sh"]
