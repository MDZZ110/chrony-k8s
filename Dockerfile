FROM alpine:3.12

# latest certs
RUN apk add ca-certificates --no-cache && update-ca-certificates

# install chrony and place default conf which can be overridden with volume
RUN apk add --no-cache chrony && mkdir -p /etc/chrony
COPY chrony.conf /etc/chrony/.

# port exposed
EXPOSE 123/udp

# start
CMD [ "/usr/sbin/chronyd", "-d", "-s"]



