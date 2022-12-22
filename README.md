# RoWeb
Web request made simple for ROBLOX executors


# Examples
## Getting website html
```lua
local RoWeb = loadstring(game:HttpGet("https://raw.githubusercontent.com/RiseValco/RoWeb/main/roweb.lua", true))()

local Web = RoWeb:new("https://example.com")

print(Web:getBody())
```

## Getting json data from api
```lua
local RoWeb = loadstring(game:HttpGet("https://raw.githubusercontent.com/RiseValco/RoWeb/main/roweb.lua", true))()

local Web = RoWeb:new("https://jsonplaceholder.typicode.com/comments?postId=1")

print(Web:getBody({JSON = true}))

```
