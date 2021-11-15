local _M = {
}
-- 分页类

function _M:new(o, params)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.params = params
    return o
end

function _M:each(func)
    if type(func) ~= 'function' then
        return
    end

    for i, v in ipairs(self.list) do
        func(i, v)
    end
end
return _M