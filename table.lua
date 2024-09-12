do -- table library: require "sorts"
    ----------------- API ------------------------------
    table = table or {}
    ---insert
    ---@param tbl table
    ---@param pos number
    ---@param value table
    function table.insert(tbl, pos, value) end
    ---unpack
    ---@param tbl table
    ---@param i number
    ---@param n number
    function table.unpack(tbl, i, n) end
    ---tostring
    ---@param tbl table|number
    function table.tostring(tbl) end
    ---remove
    ---@param tbl table
    function table.remove(tbl) end
    ---shuffle
    ---@param tbl table
    function table.shuffle(tbl) end
    ---reverse
    ---@param tbl table
    function table.reverse(tbl) end
    ---sum
    ---@param tbl table
    function table.sum(tbl) end
    ---cumsum
    ---@param tbl table
    function table.cumsum(tbl) end
    ---max
    ---@param tbl table
    function table.max(tbl) end
    ---min
    ---@param tbl table
    function table.min(tbl) end
    ---divide
    ---@param tbl table
    ---@param val number
    ---@return table
    function table.divide(tbl, val) end
    ---multiply
    ---@param tbl table
    ---@param val number
    function table.multiply(tbl, val) end
    ---splice
    ---@param tbl table
    ---@param pos_start number
    ---@param pos_end number
    ---@return table
    function table.slice(tbl, pos_start, pos_end) end
    ---copy
    ---@param tbl table|number
    ---@return table
    function table.copy(tbl) end
    ---argmax
    ---@param tbl table
    ---@return number
    function table.argmax(tbl) end
    ---argmin
    ---@param tbl table
    ---@return table
    function table.argmin(tbl) end
    -------------- Planning -----------------------------------
    -- sort = function(tbl, f, method) end -- "require sorts"
    -- table.any -- boolean
    -- table.all -- boolean
    -- table.mean
    -- table.getn
    ------------- maybe planning -------------------------------
    -- function table.get_random(tbl) end
    -- function table.swap(tbl, i, j)
    -- table.remove_swap_back(tbl)
    -- table.insert_swap_back(tbl, i)
    -------------------------------------------------------------
    function table.insert(tbl, pos, value)
        -- Определяем, передано ли значение или только позиция
        if value == nil then
            value = pos
            pos = #tbl + 1
        end

        -- Если pos выходит за границы текущей длины таблицы, добавляем в конец
        if pos > #tbl + 1 then
            pos = #tbl + 1
        end

        -- Сдвигаем элементы вправо, начиная с позиции pos
        for i = #tbl, pos, -1 do
            tbl[i + 1] = tbl[i]
        end

        -- Вставляем значение на позицию pos
        tbl[pos] = value
    end

    function table.unpack(tbl, i, n)
        i = i or 1
        n = n or #tbl
        if i <= n then
            return tbl[i], table.unpack(tbl, i + 1, n)
        end
    end

    function table.tostring(tbl)
        if tbl == nil then return nil end
        if type(tbl) ~= "table" then return tostring(tbl) end
        local str = "{"
        if #tbl == 0 then return str .. "}" end
        if #tbl == 1 then return str .. table.tostring(tbl[1]) .. "}" end
        str = str .. table.tostring(tbl[1])
        for i=2, #tbl do
            str = str .. "," .. table.tostring(tbl[i])
        end
        str = str .. "}"
        return str
    end

    function table.remove(tbl)
        local item = tbl[#tbl]
        tbl[#tbl] = nil
        return item
    end

    -- алгоритм случайного тасования Дурштенфельда
    function table.shuffle(tbl)
        for i = #tbl, 2, -1 do
            local j = math.random(1, i)
            tbl[i], tbl[j] = tbl[j], tbl[i]
        end
    end

    function table.reverse(tbl)
        if #tbl <= 1 then return end
        local n = math.floor(#tbl/2)
        for i=1, n do
            tbl[i], tbl[#tbl-i+1] = tbl[#tbl-i+1], tbl[i]
        end
    end

    function table.sum(tbl)
        local sum = 0
        for i=1, #tbl do
            sum = sum + tbl[i]
        end
        return sum
    end

    function table.cumsum(tbl)
        local cs = {}
        local sum = 0
        for i=1, #tbl do
            sum = sum + tbl[i]
            cs[i] = sum
        end
        return cs
    end

    function table.max(tbl)
        local len = #tbl
        if len == 0 then return nil end
        if len == 1 then return tbl[1] end
        local max = tbl[1]
        for i=2, #tbl do
            if tbl[i] > max then max = tbl[i] end
        end
        return max
    end

    function table.min(tbl)
        local len = #tbl
        if len == 0 then return nil end
        if len == 1 then return tbl[1] end
        local min = tbl[1]
        for i=2, #tbl do
            if tbl[i] < min then min = tbl[i] end
        end
        return min
    end

    function table.argmax(tbl)
        local len = #tbl
        if len == 0 then return nil end
        if len == 1 then return 1 end
        local idx = 1
        for i=2, #tbl do
            if tbl[i] > tbl[idx] then idx = i end
        end
        return idx
    end

    function table.argmin(tbl)
        local len = #tbl
        if len == 0 then return nil end
        if len == 1 then return 1 end
        local idx = 1
        for i=2, #tbl do
            if tbl[i] < tbl[idx] then idx = i end
        end
        return idx
    end

    function table.multiply(tbl, val)
        for i=1, #tbl do
            tbl[i] = tbl[i] * val
        end
    end

    function table.divide(tbl, val)
        for i=1, #tbl do
            tbl[i] = tbl[i] / val
        end
    end

    function table.slice(tbl, pos_start, pos_end)
        local slice = {}
        local length = pos_end - pos_start + 1
        local _pos_start = pos_start - 1
        for i = 1, length do
            slice[i] = tbl[_pos_start + i]
        end
    end

    function table.copy(tbl)
        local tbl_copy = {}
        for key, value in pairs(tbl) do
            if type(value) == "table" then
                tbl_copy[key] = table.copy(value)
            else
                tbl_copy[key] = value
            end
        end
        return tbl_copy
    end
end