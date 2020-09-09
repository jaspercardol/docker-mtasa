FROM alpine:latest

LABEL author="jaspercardol" maintainer="jaspercardol"

RUN apk update \
    && apk upgrade \
    && apk add tar curl iproute2 openssl wget unzip \
    && mkdir /mta \
    && cd /mta \
    && wget https://linux.mtasa.com/dl/multitheftauto_linux_x64.tar.gz \
    && tar -xf multitheftauto_linux_x64.tar.gz \
    && cd multitheftauto_linux_x64 \
    && mv * .. \
    && cd .. \
    && rm -rf multitheftauto_linux_x64 \
    && chmod +x mta-server64

WORKDIR /mta

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 22003/UDP 22005/TCP

CMD ["/bin/bash", "/entrypoint.sh"]
