local RoWeb = {}
RoWeb.__index = RoWeb
request = http_request or request or HttpPost or syn.request


function RoWeb:new(url, options) 
    local req = request({Url = url, Options = options})
    
    local _page = {data = req, url = url, options = options}
    setmetatable(_page, self)
    return _page
end

function RoWeb:getHeaders()
    return self.data.Headers
end


function RoWeb:getBody(options)
    if (options) and  (options.JSON) and options.JSON == true then 
        local jsonData  = nil
        local s, err = pcall(function() 
        local jsonTry = game:GetService("HttpService"):JSONDecode(self.data.Body)  
        jsonData = jsonTry
        end)
        return jsonData or "Cant parse body returned"
    end
    return self.data.Body
end

return RoWeb
