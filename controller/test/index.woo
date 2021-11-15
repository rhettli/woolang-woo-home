local _M = {}

function _M:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.version = "1"
    return o
end

function _M:index0()
     --out(import('string').format('%s/123',1))
    http_session('user_id', '1236')

    out("session got:", http_session('user_id'))
    out(dir('./user/local'))
    out(dir())
    out(dir_name())
    --out(is_cli())
end

function _M:index1()
    --chart_out()
    --
    --return '';

    out(self.version)

    local users = _new_model('users')

    users:async(123)


    --local socket = require"socket"

    out("index run:", "\n")

    local gc = require('bitmap'):new()
    out('init bitmap:', gc:round(""))

    local S = 1024

    gc:action('create', '1', S, S)

    gc:action('setRGBA', '1', 0, 0, 0, 0.1)

    out("do loop before:", gc)
    for i = 0, 360, 15 do
        gc:action('push', '1')
        gc:action('rotateAbout', '1', i, S / 2, S / 2)
        gc:action('drawEllipse', '1', S / 2, S / 2, S * 7 / 16, S / 8)
        gc:action('fill', '1')
        gc:action('pop', '1')
    end
    gc:action('savePng', '1', "out.png ", i)

    out('save pic done')

    local redis = require('redis'):new()

    local res = redis:open('127.0.0.1:6379', '', 0)
    local get_from_redis = ""
    if res == true then
        redis:exec('set', 'index', 'hello world!')
        get_from_redis = redis:exec('get', 'index')
    end
    redis:close()

    local yml = yml_default()
    out(type(yml), yml.host, yml.port)

    out('is_cli:', is_cli(), "\n")

    --local lr = _try_lock('lock_test', nil, function(r)
    --    return r
    --end, "65")

    --out('lr:=', lr, "\n")

    -- 队列测试
    --local queue = _import('lib.queue'):new()
    --queue:delay(12):push('users.sendGift', { from_user_id = 55, to_user_id = 69 })

    --http_tpl('index.html', { title = "Coder Wooyri language with Murphy"..get_from_redis })


    chart_out()
end

return _extend(_M, "lib.controller")
