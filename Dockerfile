FROM alpine:latest

LABEL author="jaspercardol" maintainer="jaspercardol"

RUN apt update \
    && apt upgrade
    && apk add libstdc++6 lib32stdc++6 libreadline5 libncursesw5 lib32ncursesw5 tar curl iproute2 openssl wget unzip
    
    
USER

ENV USER=container HOME/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
