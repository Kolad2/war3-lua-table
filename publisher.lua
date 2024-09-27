do
    ---@class Publisher
    ---@field subscribe fun(obj: Publisher, subscriber: function)
    ---@field unsubscribe fun(obj: Publisher, subscriber: function)
    ---@field publish fun(obj: Publisher,...)
    ---@overload fun():Publisher
    Publisher = Publisher or {}

    -- метатаблица для экземпляров
    Publisher.__meta = {}
    local meta = Publisher.__meta
    meta.__index = Publisher
    
    -- генератор экземлпляров класса
    meta.__create = function(cls)
        local obj = setmetatable({}, cls.__meta)
        obj.subscribers = set()
        return obj
    end
    
    -- установка метатаблицы для класса
    setmetatable(Publisher,
        {
            __call = meta.__create
        }
    )

    ------------------ методы класса -----------------------
    -- подписка на издателя
    Publisher.subscribe = function(obj, subscriber)
        obj.subscribers:add(subscriber)
    end


    -- отписка от издателя
    Publisher.unsubscribe = function(obj, subscriber) -- detach
        local subscribers = obj.subscribers
        local idx = table.find_first(subscribers, subscriber)
        if idx then table.remove(subscribers, idx) end
    end


    -- публикация издателем
    Publisher.publish = function(obj,...)
        -- local data = table.copy({...})
        local subscribers = obj.subscribers
        for _, subscriber in ipairs(subscribers) do
            subscriber(...)
        end      
    end
end
