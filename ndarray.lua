do -- require "table"
    local function create_nda(shape, n)
        n = n or 1
        local ndarray = {}
        if #shape == n then return ndarray end
        for i = 1, shape[n] do
            ndarray[i] = create_nda(shape, n + 1)
        end
        return ndarray
    end
    
    
    local function fill_1da(array, len, value)
        for i = 1, len do
            array[i] = value()
        end
    end
    
    
    local function fill_nda(array, shape, value, n)
        n = n or 1
        if #shape == n then fill_1da(array, shape[n], value) return end 
        for i = 1, shape[n] do
            fill_nda(array[i], shape, value, n + 1)
        end
    end
    
    
    local function tostring2d(ndarray)
        local _str = "{"
        for i = 1, ndarray.shape[1] do
            _str = _str .. table.tostring(ndarray[i])
            if i < ndarray.shape[1] then
                _str = _str .. ",\n "
            else
                _str = _str .. "}"
            end
        end
        return _str
    end
    
    
    NDArray = {}
    function NDArray:fill(value)
        if type(value) == "number" then func = function() return value end end
        if type(value) == "table"  then func = function() return table.copy(value) end end
        if type(value) == "function" then func = value end
        fill_nda(self, self.shape, func)
        return self
    end
    
    function NDArray:tostring()
        if self.ndim == 1 then
            return table.tostring(self)
        end
        if self.ndim == 2 then
            return tostring2d(self)
        end
        if self.ndim > 2 then
            
        end
    end
    
    local meta = {
        __index = NDArray,
        __tostring = NDArray.tostring
    }
    
    NDArray = {}
    function NDArray.create(cls, shape)
        local self = {}
        self = create_nda(shape)
        self.shape = shape
        self.ndim = #self.shape
        print("empty NDArray created")
        return setmetatable(self, meta)
    end
        
    
    NDArray = setmetatable(NDArray, {
        __call = NDArray.create
    })
end
