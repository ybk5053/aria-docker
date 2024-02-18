FROM nginx:alpine

RUN apk add --no-cache aria2 tzdata

WORKDIR /aria2
ADD ./aria2.conf /aria2/aria2.conf
ADD https://github.com/mayswind/AriaNg/releases/download/1.3.7/AriaNg-1.3.7.zip ./ariang.zip
RUN unzip -o -d /usr/share/nginx/html/ ./ariang.zip

EXPOSE 6800
EXPOSE 80
EXPOSE 443

ENV SECRET=SomethingSecure

VOLUME /downloads

RUN echo "aria2c --rpc-secret=$SECRET --conf-path=/aria2/aria2.conf" > /docker-entrypoint.d/start-aria2.sh
