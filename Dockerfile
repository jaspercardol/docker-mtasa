FROM alpine:latest

LABEL author="jaspercardol" maintainer="jaspercardol"

WORKDIR /config

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 22003/UDP 22005/TCP

CMD ["sh", "/entrypoint.sh"]
