do
    Publisher = Publisher or {}
    -- мета таблица для экземпляров
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
    
    -- подписка на издателя
    function Publisher:subscribe(subscriber)
        table.insert(self.subscribers, subscriber)
    end
    
    -- публикация
    function Publisher:publish(...)
        -- local data = table.copy({...})
        local subscribers = self.subscribers
        for i, subscriber in ipairs(subscribers) do
            print("sub num",i)
            subscriber(...)
        end      
    end
    
    function Publisher:unsubscribe(subscriber)
        local subscribers = self.subscribers
        local idxs = table.find(subscribers, subscriber)
        for i, idx in ipairs(idxs) do
            table.remove(subscribers, idx)
        end
    end
end
