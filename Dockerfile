FROM alpine

RUN apk add --no-cache aria2 tzdata

WORKDIR /aria2
ADD ./aria2.conf /aria2/aria2.conf

EXPOSE 6800

ENV SECRET=SomethingSecure

VOLUME /downloads

CMD aria2c --rpc-secret=$SECRET --conf-path=/aria2/aria2.conf
