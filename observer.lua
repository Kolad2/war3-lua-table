do
    table = table or {}
    table.tools = table.tools or {} 
    table.tools.Observer = table.tools.Observer or {}
    
    ---@class Observer
    ---@field subscribe fun(obj: Observer, subscriber: function)
    ---@field unsubscribe fun(obj: Observer, subscriber: function)
    ---@field publish fun(obj: Observer,...)
    ---@overload fun():Observer
    local Observer = table.tools.Observer or {}

    -- метатаблица для экземпляров
    Observer.__meta = {}
    local meta = Observer.__meta
    meta.__index = Observer
    
    -- генератор экземлпляров класса
    meta.__create = function(cls)
        local obj = setmetatable({}, cls.__meta)
        obj.subscribers = set()
        return obj
    end
    
    -- установка метатаблицы для класса
    setmetatable(Observer,
        {
            __call = meta.__create
        }
    )

    ------------------ методы класса -----------------------
    -- подписка на наблюдателя
    Observer.subscribe = function(obj, subscriber) -- attach?
        return obj.subscribers:insert(subscriber)
    end

    -- отписка от наблюдателя
    Observer.unsubscribe = function(obj, subscriber) -- detach?
        local subscribers = obj.subscribers
        local idx = table.find_first(subscribers, subscriber)
        if idx then table.remove(subscribers, idx) end
    end

    -- публикация подписчикам
    Observer.publish = function(obj,...)
        obj.subscribers:each(
            function(sub,...) sub(...) end,...)    
    end
    
    -- раздача копий подписчикам
    Observer.distribute = function(obj,...)
        local data = {...}
        obj.subscribers:each(
            function(sub, data)
                local data_copy = table.deepcopy(data)                
                sub(table.unpack(data_copy)) 
            end,
            data
        )
    end
    
    -- уведомление подписчиков
    Observer.notify = function(obj)
        obj.subscribers:each(
            function(sub) sub() end
        )    
    end
    
end
