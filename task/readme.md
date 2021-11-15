> task任务创建目录，请勿修改sys目录下的文件内容，如果你知道是做什么的

## 创建task文件：

**1.)直接使用命令行创建`woo murphy task add [task file name] [task function]`**

> 比如(task function 支持多个，多个请使用逗号分割)：
>
> woo murphy task add member find,add,del,forbidden,update

### 上述命令执行完毕将会在task目录下生成一个member.woo文件，文件的内容为：

```lua
return {
    find = function(args, lan)

    end,
    add = function(args, lan)

    end,
    del = function(args, lan)

    end,
    forbidden = function(args, lan)

    end,
    update = function(args, lan)

    end
} 
```

**2.)调用member.woo内的find方法：`woo murphy member find [arg1] [arg2] [arg3] [...]`**
> arg1 arg2 arg3 ... 是传入参数，可以省略

## 可以加入自己的修改来查询成员

```lua
return {
    find = function(args, lan)

        -- 如果使用命令 woo murphy find id 100
        local filed = args[1]  -- filed=id
        local value = args[2] -- value=100

        if not _is_valid(filed) then
            print(({ en = 'need key and value', zh = '缺少待查询的字段和值' })[lan])
            return
        end

        if not _is_valid(value) then
            value = filed
            filed = 'id'
            print(({ en = 'not get filed,will find id=' .. value, zh = '没有提供字段，查询id=' .. value })[lan])
        else
            print(({ en = 'find id=' .. value, zh = '查询id=' .. value })[lan])
        end
        -- 这里使用__model中的魔术方法可以取到member对象，进而查询
        local member = __model.member:findFirstBy(filed, value)
        _out('Member:', member)
    end,
    add = function(args, lan)

    end,
    del = function(args, lan)

    end,
    forbidden = function(args, lan)

    end,
    update = function(args, lan)

    end
}
```

### 如果想查询id=100的用户的信息:`woo murphy member find id 100`

### 如果在unix系统中murphy加了可执行权限，那么命令可以简化为:`./murphy member find id 100`
