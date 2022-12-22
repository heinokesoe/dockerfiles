FROM alpine
RUN apk add --no-cache --update lighttpd
COPY files /etc/lighttpd
EXPOSE 80
ENTRYPOINT ["lighttpd", "-D"]
CMD ["-f", "/etc/lighttpd/lighttpd.conf"]
