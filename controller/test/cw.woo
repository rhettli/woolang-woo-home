local _M = {}

function _M:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.version = "1"
    return o
end

function _M:download()
    local _ver = _new_model('cw_version')
    local ver = _ver:findFirst({ order = 'ver desc' })
    if _is_valid(ver) then
        http_redirect(302, ver.addr)
    end
end
return _extend(_M, "lib.controller")