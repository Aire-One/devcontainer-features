
# LuaRocks (luarocks)

LuaRocks is a package manager for Lua modules.

## Example Usage

```json
"features": {
    "ghcr.io/Aire-One/devcontainer-features/luarocks:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | The LuaRocks version to install. Should be a valid LuaRocks release version from https://github.com/luarocks/luarocks/releases. | string | 3.12.2 |

# Notes

This feature needs Lua to be installed in the container. It is recommended to
use it together with the [Lua feature](https://github.com/Aire-One/devcontainer-features/tree/main/src/lua).


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/Aire-One/devcontainer-features/blob/main/src/luarocks/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
