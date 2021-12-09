#!/bin/sh

mkdir -p /usr/local/bin

curl -s https://raw.githubusercontent.com/jakoberpf/vault2env/master/src/vault2env -o /usr/local/bin/vault2env

chmod +x /usr/local/bin/vault2env
