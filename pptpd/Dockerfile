FROM alpine
RUN apk add --no-cache --update pptpd iptables
COPY etc/pptpd.conf /etc/pptpd.conf
COPY etc/ppp/options.pptpd /etc/ppp/options.pptpd
COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
