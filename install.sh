#!/bin/sh

mkdir -p /usr/local/bin

curl -s https://raw.githubusercontent.com/polymatic-systems/vault2env/master/src/vault2env -o /usr/local/bin/vault2env

chmod +x /usr/local/bin/vault2env
