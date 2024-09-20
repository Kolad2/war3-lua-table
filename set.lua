do
    ---@class set
    ---@field remove fun(self:set, item:any): boolean
    local object = {}

    ---@param item any
    function object:insert(item)
        if self.__index_table:has(item) then
            print("Ошибка: элемент уже существовал")
            return false
        end
        table.insert(self, item)
        self.__index_table:set(item, #self)
        return true
    end
    object.add = object.insert


    ---@param item any
    ---@return boolean
    function object:remove(item)
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


    function object:get_random()
        return table.get_random(self)
    end


    function object:remove_random()
        self:remove(self:get_random())
    end


    local object_meta = {
        __index = object,
        __tostring = table.tostring
    }


    ---set
    ---@return set
    function set(tbl)
        local self = {} ---@type set
        self.__index_table = dict()

        return setmetatable(self, object_meta)
    end
end