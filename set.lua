do
    ---Set
    ---@return set
    function set()
        local self = table {} ---@type table
        self.__index_table = dict()

        ---@param item any
        function self:insert(item)
            if self.__index_table:has(item) then
                print("Ошибка: элемент уже существовал")
                return false
            end
            table.insert(self, item)
            self.__index_table:set(item, #self)
            return true
        end
        self.add = self.insert

        ---@param idx number
        ---@return boolean
        function self:remove(item)
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

        return self -- setmetatable(self, meta)
    end
end