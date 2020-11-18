#!/bin/bash

apk info -vv | grep 'iproute2'
if [[ $? -eq 1 ]]; then
  apk update
  apk add tar curl iproute2 openssl wget unzip

if [ -z "$(ls -A /config)" ]; then # Is /config empty?
    mkdir /config/tmp
    cd /config/tmp
    wget https://linux.mtasa.com/dl/multitheftauto_linux_x64.tar.gz
    tar -xf multitheftauto_linux_x64.tar.gz
    cd multitheftauto_linux_x64
    mv * /config
    cd /config
    rm -rf tmp
    

./mta-server64
