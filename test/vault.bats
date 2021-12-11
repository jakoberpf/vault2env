#!/usr/bin/env bats
GIT_ROOT=$(git rev-parse --show-toplevel)
cd $GIT_ROOT

setup() {
  $GIT_ROOT/test/docker/up.sh
  source $GIT_ROOT/test/docker/.env
}

teardown() {
  $GIT_ROOT/test/docker/down.sh
}

@test "Verify that vault address is set" {
  [ "$VAULT_ADDR" == "http://0.0.0.0:8200" ]
}

@test "Verify that vault is unseal" {
  result="$(vault status | grep "Sealed" | tr -s ' ' | cut -d " " -f2)"
  [ "$result" == "false" ]
}

@test "Verify that vault initialized" {
  result="$(vault status | grep "Initialized" | tr -s ' ' | cut -d " " -f2)"
  [ "$result" == "true" ]
}
