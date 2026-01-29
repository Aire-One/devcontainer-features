# Dev Container Features

## Features

- [lua](src/lua/README.md) - Installs Lua, a powerful, efficient, lightweight, embeddable scripting language
- [luarocks](src/luarocks/README.md) - Installs LuaRocks, the package manager for Lua modules

## Development

Test with:

```sh
devcontainer features test
```

Publish from the GitHub Actions `release` workflow. Make sure to update versions
in `src/*/devcontainer-feature.json`.