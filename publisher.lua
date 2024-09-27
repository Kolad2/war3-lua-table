do
    ---@class Publisher
    Publisher = Publisher or {}

    -- метатаблица для экземпляров
    Publisher.__meta = {}
    local meta = Publisher.__meta
    meta.__index = Publisher
    
    -- генератор экземлпляров класса
    meta.__create = function(cls)
        local obj = setmetatable({}, cls.__meta)
        obj.subscribers = {}
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
    function Publisher:subscribe(subscriber)
        table.insert(self.subscribers, subscriber)
    end
    
    -- публикация издателем
    function Publisher:publish(...)
        -- local data = table.copy({...})
        local subscribers = self.subscribers
        for i, subscriber in ipairs(subscribers) do
            print("sub num",i)
            subscriber(...)
        end      
    end

    -- отписка от издателя
    function Publisher:unsubscribe(subscriber) -- detach
        local subscribers = self.subscribers
        local indices = table.find(subscribers, subscriber)
        for _, idx in ipairs(indices) do
            table.remove(subscribers, idx)
        end
    end
end
