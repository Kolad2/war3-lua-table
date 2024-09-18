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

    NDArray = {}

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

    local class = {}

    function class:create(shape)
        print("Начало создания NDArray")
        local obj = {}
        obj.shape = shape
        obj.ndim = #obj.shape
        self:emptify(obj)
        print("empty NDArray created")
        return setmetatable(obj, object_meta)
    end

    local empty = math.empty or function()
        return nil
    end

    ---emptify
    ---@param ndarray table
    ---@return table
    function class:emptify(ndarray)
        local shape = ndarray.shape
        local ndarray = ndarray

        if #shape == n then
            return table.fill(ndarray, empty, shape[n])
        end

        local old_stack = {}
        local new_stack = {}
        table.insert(old_stack, ndarray)
        --
        for n = 1, #shape - 1 do
            for i, ndarray in ipairs(old_stack) do
                table.fill(ndarray, table.empty, shape[n])
                for j, item in ipairs(ndarray) do
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