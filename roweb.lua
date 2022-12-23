local RoWeb = {Version = "v0.2.4"}
RoWeb.__index = RoWeb
request = http_request or request or HttpPost or syn.request


function RoWeb:new(url, options)
    local options = options or {}
    options.Url = url
    local req = request(options)
    
    local _page = {data = req, url = options.Url, options = options}
    setmetatable(_page, self)
    return _page
end

function toJson(string)
    local jsonData = nil
    local s, err = pcall(function() 
        local jsonTry = game:GetService("HttpService"):JSONDecode(string)  
        jsonData = jsonTry
    end)   
    return jsonData or false
end

function RoWeb:toJson(string)
    local jsonData = nil
    local s, err = pcall(function() 
        local jsonTry = game:GetService("HttpService"):JSONDecode(string)  
        jsonData = jsonTry
    end)   
    return jsonData or false
end

function RoWeb:getHeaders()
    return self.data.Headers
end

function RoWeb:getCookies()
    return self.data.Cookies
end

function RoWeb:getFingerprint() 
    local fingerprint = {}
    local req = request({Url = "https://httpbin.org/headers"})
   for _,v in pairs(toJson(req.Body).headers) do
    if string.find(_:lower(), "fingerprint") then 
    fingerprint[_] = v
        else if string.find(_:lower(), "identifier") or string.find(_:lower(), "hwid")  then
            fingerprint[_] = v
        else if string.find(_:lower(), "agent") then
            fingerprint[_] = v
        else if string.find(_:lower(), "id") and _:lower() ~= "x-amzn-trace-id" then
            fingerprint[_] = v
        end
    end
    end
    end
   end
   return fingerprint
end

function RoWeb:getBody(options)
    if (options) and  (options.JSON) and options.JSON == true then 
        local jsonData = nil
        local s, err = pcall(function() 
        local jsonTry = game:GetService("HttpService"):JSONDecode(self.data.Body)  
        jsonData = jsonTry
        end)
        if (err) then return error("Cant parse body") end
        return jsonData 
    end
    return self.data.Body
end

return RoWeb
