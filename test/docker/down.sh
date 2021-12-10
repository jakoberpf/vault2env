#!/usr/bin/env bash
GIT_ROOT=$(git rev-parse --show-toplevel)
cd "$GIT_ROOT"/test/docker

echo "Powering down Vault"
docker-compose down

echo "Cleanup Vault data"
rm -rf data/