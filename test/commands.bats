#!/usr/bin/env bats
GIT_ROOT=$(git rev-parse --show-toplevel)
cd $GIT_ROOT

vault2env_bin="./src/vault2env"

setup() {
   $GIT_ROOT/test/docker/up.sh
   vault secrets enable -version=2 kv
}

teardown() {
   $GIT_ROOT/test/docker/down.sh
}

@test "Test file creation of default file name" {
  vault kv put kv/test testKey=testValue
  result="$($vault2env_bin kv/test)"
  [ -f ".env" ]
  source .env
  [ "$testKey" == "testValue" ]
  rm .env
}

@test "Test file creation custom file name" {
  vault kv put kv/test testKey=testValue
  result="$($vault2env_bin kv/test .env.custom)"
  [ -f ".env.custom" ]
  source .env.custom
  [ "$testKey" == "testValue" ]
  rm .env.custom
}

@test "Test single secrets with single env and default file name" {
  vault kv put kv/test testKey=testValue
  result="$($vault2env_bin kv/test)"
  [ -f ".env" ]
  source .env
  [ "$testKey" == "testValue" ]
  rm .env
}

@test "Test single secrets with mutiple envs and default file name" {
  vault kv put kv/test testKey=testValue
  result="$($vault2env_bin kv/test)"
  [ -f ".env" ]
  rm .env
}

@test "Test file creation from single secrets with mutiple envs and custom file name" {
  vault kv put kv/test key1=value1
  result="$($vault2env_bin kv/test .env.custom)"
  [ -f ".env.custom" ]
  rm .env.custom
}
