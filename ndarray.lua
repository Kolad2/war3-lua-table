do -- require "table"

    local function tostring2d(ndarray)
        local _str = "{"
        for i = 1, #ndarray do
            _str = _str .. table.tostring(ndarray[i])
            if i < #ndarray then
                _str = _str .. ",\n "
            else
                _str = _str .. "}"
            end
        end
        return _str
    end



    ---@field create fun(self:table, shape:table):table
    ---@field emptify fun(self:table, ndarray:NDArray):table
    NDArray = NDArray or {} ---@type table|fun(shape:table):table


    ---@field fill fun(self:NDArray, value:any):table
    ---@field tostring fun(self:NDArray):string
    local object = {}

    function object:fill(value)
        NDArray:fill_nda(self, self.shape, value)
        return self
    end

    function object:tostring()
        if self.ndim == 1 then
            return table.tostring(self)
        end
        if self.ndim == 2 then
            return tostring2d(self)
        end
        if self.ndim == 3 then
            local str = "{\n\n"
            for i = 1, #self do
                str = str .. tostring2d(self[i]) .. ",\n\n"
            end
            return str
        end
    end

    local object_meta = {
        __index = object,
        __tostring = object.tostring
    }

    ---@field create fun(shape:table):table
    local class = {}

    ---create
    ---@param shape table
    ---@return NDArray
    function class:create(shape)
        ---@class NDArray
        ---@field fill fun(self:table, value:any):table
        ---@field tostring fun(self:table):string
        local obj = {}
        obj.shape = shape
        obj.ndim = #obj.shape
        self:emptify(obj)
        return setmetatable(obj, object_meta)
    end

    local empty = math.empty or function()
        return nil
    end

    ---emptify
    ---@param ndarray NDArray
    ---@return NDArray
    function class:emptify(ndarray)
        local shape = ndarray.shape

        if #shape == n then
            return table.fill(ndarray, empty, shape[n])
        end

        local old_stack = {}
        local new_stack = {}
        table.insert(old_stack, ndarray)
        --
        for n = 1, #shape - 1 do
            for _, _ndarray in ipairs(old_stack) do
                table.fill(_ndarray, table.empty, shape[n])
                for _, item in ipairs(_ndarray) do
                    table.insert(new_stack, item)
                end
            end
            old_stack = new_stack
            new_stack = {}
        end
    end

    function class:fill_nda(array, shape, value, n)
        n = n or 1
        if #shape == n then table.fill(array, value, shape[n]) return end
        for i = 1, shape[n] do
            self:fill_nda(array[i], shape, value, n + 1)
        end
    end


    NDArray = setmetatable(NDArray, {
        __index = class,
        __call = class.create
    })
end