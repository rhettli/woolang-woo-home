local class_msg = {}

--function class_msg:init(o)
--    local r, e = self:checkShortPsw()
--    if not r then
--        return self:renderJSON(nil, e, -1)
--    end
--
--end

function class_msg:new(o)
    o = o or {}

    self.psw = "/*415 saj25?>j|\\"
    self.version = "1"
    local conf = _import('conf.conf')
    conf.cloud_file_path = _str_replace(conf.cloud_file_path, '#home#', home())
    self._conf = conf
    return self
end

function class_msg:get()
    local r, e = self:checkShortPsw()
    if not r then
        return self:renderJSON(nil, e, -1)
    end

end

function class_msg:send()
    local r, e = self:checkShortPsw()
    if not r then
        return self:renderJSON(nil, e, -1)
    end

    local file_id = _http_params('file_id')
    local token = _http_params('token')

    local t = require('oshine/cw_jwt'):new(self.psw, self.psw, 'nonce')
    if not _is_valid(token) then
        return self:renderJSON(nil, 'token fail', -1)
    else
        local r, e = t:decode({ ip = _http_ip() })
        if e ~= nil or _http_ip() ~= r.ip or r.member_id ~= self:currentMemberId() then
            return self:renderJSON(nil, e or 'err', -1)
        end

    end

    if not _is_valid(file_id) then
        return self:renderJSON(nil, 'fail:', -1)
    end
    local cf = _new_model('cloud_file')
    local cloud_file = cf:findFirstBy('id', file_id)
    if not _is_valid(cloud_file) then
        return self:renderJSON(nil, 'file not find:', -1)
    end
    cloud_file.download_times = cloud_file.download_times + 1
    cloud_file:save()

    return http_send_file(cloud_file.folder .. cloud_file.name)
end

return _extend(class_msg, "controller.api.base")