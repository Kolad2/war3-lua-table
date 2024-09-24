do
    ---@class set
    ---@field remove fun(self:set, item:any): boolean
    ---@field insert fun(self:set, item:any): boolean
    ---@field add fun(self:set, item:any): boolean
    ---@field has fun(self:set, item:any): boolean
    ---@field get_random fun(self:set): any
    ---@field remove_random fun(self:set)
    ---@field create fun(self:set, tbl:table): set
    ---@overload
    set = set or {}

    ---@param item any
    ---@return boolean
    function set:insert(item)
        if self.__index_table:has(item) then
            return false
        end
        table.insert(self, item)
        self.__index_table:set(item, #self)
        return true
    end

    ---@param item any
    ---@return boolean
    function set:add(item)
        if self:insert(item) then
            return true
        end
        print("Ошибка: элемент уже существовал")
        return false
    end

    ---@param item any
    ---@return boolean
    function set:has(item)
        return self.__index_table:has(item)
    end

    --- Removes an item from the set.
    ---@param item any The item to remove.
    ---@return boolean Returns `true` if the item was successfully removed, `false` otherwise.
    function set:remove(item)
        local idx = self.__index_table:get(item)
        if not idx then
            print("Ошибка: элемент не существовал")
            return false
        end
        table.remove_swap(self, idx)
        if self[idx] ~= nil then
            self.__index_table:remove(item)
            self.__index_table:set(self[idx], idx)
            return true
        else
            self.__index_table:remove(item)
        end
        return false
    end


    function set:get_random()
        return table.get_random(self)
    end

    function set:remove_random()
        return self:remove(self:get_random())
    end


    set.object_meta = {
        __index = set,
        __tostring = table.tostring
    }


    --- Создаёт новое множество.
    ---@param tbl? table Начальная таблица элементов (опционально).
    ---@return set Новое множество.
    function set:create(tbl)
        tbl = tbl or {} ---@type set
        tbl, tbl.__index_table = table.unique(tbl)
        return setmetatable(obj, self.object_meta)
    end

    setmetatable(set, {__call = set.create})
end
