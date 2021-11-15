local class_article = {}

function class_article:new(o)
    o = o or {}

    return self
end

function class_article:list()

end

function class_article:search()
    local member_id = self:currentMemberId()
    if self:checkEnoughTimes('_feed:' .. member_id, 5, 24 * 3600) then
        return self:renderJSON(nil, 'Do not operate too much times', -1)
    end

    local file_id = _http_params('content')
    local token = _http_params('token')

end

return _extend(class_article, "controller.api.base")