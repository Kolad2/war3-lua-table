do
    table = table or {}

    table.meta = {
        __index = table,
        __tostring = table.tostring,
        __add = nil,             -- сложение
        __sub = nil,             -- вычитание
        __mul = table.multiply,  -- умножение
        __div = table.divide     -- деление
    }

    function table.setmetatable(tbl)
        return setmetatable(tbl, table.meta)
    end

    setmetatable(table, {
        __call = table.setmetatable
    })

end