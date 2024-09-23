do


    local object = {} ---@type dict

    ---@param key any
    ---@param item any
    function object:set(key, item)
        self.data[key] = item
    end

    function object:remove(key)
        self.data[key] = nil
    end

    function object:has(key)
        return self.data[key] ~= nil
    end

    function object:get(key)
        return self.data[key]
    end

    local dict_meta = {
        __index = object
    }

    ---@return dict
    function dict()
        self = {
            data = {}
        }
        return setmetatable(self, dict_meta)
    end

end
