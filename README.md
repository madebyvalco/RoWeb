# RoWeb
Web request made simple for ROBLOX executors


# Example
## Getting website html
```lua
local RoWeb = loadstring(game:HttpGet("https://raw.githubusercontent.com/RiseValco/RoWeb/main/roweb.lua", true))()

local Web = RoWeb:new("https://example.com")

print(Web:getBody())
```

## Getting json data from api
```lua
local RoWeb = loadstring(game:HttpGet("https://raw.githubusercontent.com/RiseValco/RoWeb/main/roweb.lua", true))()

local Web = RoWeb:new("https://www.uuidtools.com/api/generate/v1")

print(Web:getBody({JSON = true))

```
