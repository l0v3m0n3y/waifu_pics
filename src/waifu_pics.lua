local http = require("socket.http")
local json = require("dkjson")
local ltn12 = require("ltn12") 

local Client = {}
Client.__index = Client

function Client.new()
    local self = setmetatable({}, Client)
    self.api = "https://api.waifu.pics"
    return self
end

function Client:get_pics(type_pics,category)
    local url = self.api .. "/".. type_pics .. "/".. category
    local response_body, code = http.request(url)
    return json.decode(response_body)
    end

function Client:many_pics(type_pics, category)
    local url = self.api .. "/many/" .. type_pics .. "/" .. category
    local response_chunks = {}
    local res, code, headers, status = http.request({
        url = url,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json",
            ["Content-Length"] = "2" 
        },
        source = ltn12.source.string("{}"),
        sink = ltn12.sink.table(response_chunks)
    })
    local full_response = table.concat(response_chunks)
    return json.decode(full_response)
end

return Client
