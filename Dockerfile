FROM alpine:latest

LABEL author="jaspercardol" maintainer="jaspercardol"

RUN apt update \
    && apt upgrade
    && apk add libstdc++6 lib32stdc++6 libreadline5 libncursesw5 lib32ncursesw5 tar curl iproute2 openssl wget unzip
    && mkdir /mta
    && cd /mta
    && wget https://linux.mtasa.com/dl/multitheftauto_linux_x64.tar.gz
    && unzip multitheftauto_linux_x64.tar.gz
    && chmod +x mta-server64
    
USER

ENV USER=container HOME=/home/container

WORKDIR /mta

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
