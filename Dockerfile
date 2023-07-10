FROM alpine

RUN apk add --no-cache aria2 tzdata

EXPOSE 6800

ENV SECRET=SomethingSecure
ENV MAXCONN=5

VOLUME /downloads

CMD aria2c --dir=/downloads --enable-rpc --disable-ipv6 --rpc-allow-origin-all --rpc-listen-all --rpc-listen-port=6800 --rpc-secret=$SECRET --max-connection-per-server=$MAXCONN