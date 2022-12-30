FROM alpine
RUN apk add --no-cache --update gitolite cgit lighttpd fcgiwrap spawn-fcgi openssh py3-markdown py3-pygments
COPY lighttpd.conf /etc/lighttpd/
COPY sshd_config cgitrc gitoliterc /etc/
COPY entrypoint.sh /
VOLUME /var/lib/git /etc/ssh
EXPOSE 22 8080
ENTRYPOINT ["/entrypoint.sh"]
