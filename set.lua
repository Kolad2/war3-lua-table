do
    ---@class set
    ---@field remove fun(self:set, item:any): boolean
    ---@field insert fun(self:set, item:any): boolean
    ---@field add fun(self:set, item:any): boolean
    ---@field has fun(self:set, item:any): boolean
    ---@field get_random fun(self:set): any
    ---@field remove_random fun(self:set)
    ---@field create fun(self:set, tbl:table): set
    ---@field __index_dict dict
    ---@overload fun(tbl:table): set
    set = set or {}

    ---@param obj set
    ---@param item any
    ---@return boolean
    set.insert = function(obj, item)
        if obj.__index_dict:has(item) then
            return false
        end
        table.insert(obj, item)
        obj.__index_dict:set(item, #obj)
        return true
    end

    ---@param item any
    ---@return boolean
    set.add = function(obj, item)
        if obj:insert(item) then
            return true
        end
        print("Ошибка: элемент уже существовал")
        return false
    end

    ---@param item any
    ---@return boolean
    function set:has(item)
        return self.__index_dict:has(item)
    end

    --- Removes an item from the set.
    ---@param item any The item to remove.
    ---@return boolean Returns `true` if the item was successfully removed, `false` otherwise.
    function set:remove(item)
        local idx = self.__index_dict:get(item)
        if not idx then
            print("Ошибка: элемент не существовал")
            return false
        end
        table.remove_swap(self, idx)
        if self[idx] ~= nil then
            self.__index_dict:remove(item)
            self.__index_dict:set(self[idx], idx)
            return true
        else
            self.__index_dict:remove(item)
        end
        return false
    end


    function set:get_random()
        return table.get_random(self)
    end

    function set:remove_random()
        return self:remove(self:get_random())
    end

    ---@param _set set Второе множество.
    ---@return set Новое объединённое множество.
    function set:union(_set)
        for _, item in ipairs(_set) do
            self:insert(item)  -- Добавляем элементы из второго множества
        end
        return self
    end

    set.each = function(obj, callback,...)
        for _, item in ipairs(obj) do
            callback(item,...)    
        end
    end
    
    --- Возвращает новое множество, являющееся пересечением текущего множества и второго.
    ---@param _set set Второе множество.
    ---@return set Пересечённое множество.
    function set:intersection(_set)
        local i = 1
        while i <= #self do
            local item = self[i]
            if _set:has(item) then
                i = i + 1
            else
                self:remove(item)
            end
        end
        return self
    end


    ---@param _set set Второе множество.
    ---@return set Новое множество-разность.
    function set:difference(_set)
        local i = 1
        while i <= #self do
            local item = self[i]
            if _set:has(item) then
                self:remove(item)
            else
                i = i + 1
            end
        end
        return self
    end


    set.object_meta = {
        __index = set,
        __tostring = table.tostring,
        __add = function(set1, set2) return set.union(set(table.copy(set1)), set2)  end,
        __mul = function(set1, set2) return set.intersection(set(table.copy(set1)), set2)  end,
        __sub = function(set1, set2) return set.difference(set(table.copy(set1)), set2)  end
    }


    --- Создаёт новое множество.
    ---@param tbl table|set Начальная таблица элементов (опционально).
    ---@return set Новое множество.
    function set:create(tbl)
        tbl = tbl or {} ---@type set
        tbl, tbl.__index_dict = table.unique(tbl)
        return setmetatable(tbl, self.object_meta)
    end

    setmetatable(set, {__call = set.create})
end
