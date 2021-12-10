#!/usr/bin/env bats
GIT_ROOT=$(git rev-parse --show-toplevel)
cd $GIT_ROOT

setup() {
   $GIT_ROOT/test/docker/up.sh
}

teardown() {
   echo "teardown"
   $GIT_ROOT/test/docker/down.sh
}

@test "Test the install script" {
  ./install.sh
  [ -f "/usr/local/bin/vault2env" ]
}

@test "Test the install method" {
  curl -o- https://raw.githubusercontent.com/jakoberpf/vault2env/master/install.sh | bash
  [ -f "/usr/local/bin/vault2env" ]
}
