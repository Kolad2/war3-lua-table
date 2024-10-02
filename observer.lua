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
    -- подписка на издателя
    Observer.subscribe = function(obj, subscriber)
        return obj.subscribers:insert(subscriber)
    end


    -- отписка от издателя
    Observer.unsubscribe = function(obj, subscriber) -- detach
        local subscribers = obj.subscribers
        local idx = table.find_first(subscribers, subscriber)
        if idx then table.remove(subscribers, idx) end
    end


    -- публикация издателем
    Observer.publish = function(obj,...)
        -- local data = table.copy({...})
        local subscribers = obj.subscribers
        for _, subscriber in ipairs(subscribers) do
            subscriber(...)
        end      
    end
end
