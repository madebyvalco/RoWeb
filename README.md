# RoWeb
Web request made simple for ROBLOX executors

## Support
It supports mostly every executor. If it uses ``http_request or request or HttpPost or syn.request`` then it supports it


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

## Using options
```lua
local RoWeb = loadstring(game:HttpGet("https://raw.githubusercontent.com/RiseValco/RoWeb/main/roweb.lua", true))()

local Web = RoWeb:new("https:/signuphere.com/api/signup", {
    Method = "POST",
    Headers = {
            ["accept"] = "application/json" 
    },
    Body = game:GetService("HttpService"):JSONEncode({
        Username = "User123",
        Password = "Secure_Password123"
    })
})
print(Web:getBody({JSON = true}))
```
