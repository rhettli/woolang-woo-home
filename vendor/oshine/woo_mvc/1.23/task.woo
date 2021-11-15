
local _M = {
}

function _M:new(o,params)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.params = params
    return o
end


function _M:start(p)
    return _http_params(p)
end

return _M