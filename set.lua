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
            self:set(item, #self)
            return true
        end
        self.add = self.append

        ---@param idx number
        ---@return boolean
        function self:pop_swap(idx)
            local item = self:super_pop_swap(idx)
            if item~=nil then
                if self[idx]~=nil then self:_set_index(self[idx], idx) end
                self:_clear_index(item)
                return true
            end
            return false
        end

        ---@param item any
        function self:remove(item)
            local idx = self:_get_index(item)
            if not idx then
                print("Ошибка: элемент не существовал")
                return false
            end
            return self:pop_swap(idx)
        end

        return setmetatable(self, meta)
    end
end