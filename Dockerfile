FROM alpine:latest

LABEL author="jaspercardol" maintainer="jaspercardol"

RUN apk update \
    && apk upgrade \
    && apk add tar curl iproute2 openssl wget unzip \
    && mkdir /mta \
    && cd /mta \
    && wget https://linux.mtasa.com/dl/multitheftauto_linux_x64.tar.gz \
    && tar multitheftauto_linux_x64.tar.gz \
    && chmod +x mta-server64

WORKDIR /mta

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
