
# Vault2Env

Pull Hashicorp Vault K/V paths and convert them into environment variables.

Vault2Env will pull paths from a Hashicorp Vault k/v store, convert the key/values into environment variables, and store them to a file.

## Getting Started

Simply run the install.sh script:

```
curl -o- https://raw.githubusercontent.com/polymatic-systems/vault2env/master/install.sh | bash
```

Or, copy src/vault2env to a /bin directory and make it executable. The file is POSIX compatible and should work as long as you have the required dependent commands.

## Usage

```
vault2env COMMA-SEPARATED-PATHS PATH-TO-FILE
```

For example:

```
vault2env "org/staging/database,org/staging/app" vault.env
```

## Important

`vault2env` requires that you have both the `vault` and `jq` installed. You will also need to authenticate with your Vault before using `vault2env`.

If the secret data pulled from Vault contains any variables that are already defined locally, then the existing variable will be used instead (this allows for overriding variables in a pipeline).

## License

[Apache License 2.0](https://github.com/polymatic-systems/vault2env/blob/master/LICENSE)

---

Copyright 2021 Polymatic Systems Ltd
