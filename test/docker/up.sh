#!/usr/bin/env bash
GIT_ROOT=$(git rev-parse --show-toplevel)
cd "$GIT_ROOT"/test/docker

echo "Start up Vault"
docker-compose up -d

source .env

vault status
while [ $? -ne 0 ]; do
    echo "Waiting for Vault to be ready..."
done

vault operator unseal "$UNSEAL_KEY_1"
vault operator unseal "$UNSEAL_KEY_3"
vault operator unseal "$UNSEAL_KEY_5"

vault_status=$(vault status | grep "Sealed" | tr -s ' ' | cut -d " " -f2)
if [ "$vault_status" == "true" ]; then
    echo "Unsealing the Vault failed"
    exit 1
fi

echo "Vault is ready"
