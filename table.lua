do
    --[[war3-lua-table (13.09.2024)]]--
    table = table or {}

    ---@return table
    function table.empty()
        return {}
    end
    
    ---insert
    ---@param tbl table
    ---@param pos number
    ---@param value number
    ---@return table
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
        return tbl
    end

    ---unpack
    ---@param tbl table
    ---@param start_pos number
    ---@param end_pos number
    ---@return table
    function table.unpack(tbl, start_pos, end_pos)
        start_pos = start_pos or 1
        end_pos = end_pos or #tbl
        if start_pos <= end_pos then
            return tbl[i], table.unpack(tbl, start_pos + 1, end_pos)
        end
    end

    ---pack
    ---@return table
    function table.pack(...)
        return { ... }
    end

    ---tostring
    ---@param tbl table
    ---@return table
    function table.tostring(tbl)
        if tbl == nil then return tostring(nil) end
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

    ---remove
    ---@param tbl table
    ---@param tbl number|nil
    ---@return any
    table.remove = table.remove or function(tbl, idx)
        idx = idx or #tbl
        local item = tbl[idx]
        for i = idx, #tbl - 1 do
            tbl[i] = tbl[i + 1]
        end
        tbl[#tbl] = nil
        return item
    end


    ---remove_swap
    ---@param tbl table
    ---@param idx number
    ---@return any
    function table.remove_swap(tbl, idx)
        idx = idx or #tbl
        tbl[idx]  = tbl[#tbl]
        local item = tbl[#idx]
        tbl[#tbl] = nil
        return item
    end


    ---shuffle
    ---@param tbl table
    ---@return table
    function table.shuffle(tbl)
        -- алгоритм случайного тасования Дурштенфельда
        for i = #tbl, 2, -1 do
            local j = math.random(1, i)
            tbl[i], tbl[j] = tbl[j], tbl[i]
        end
    end

    ---reverse
    ---@param tbl table
    ---@return table
    function table.reverse(tbl)
        if #tbl <= 1 then return end
        local n = math.floor(#tbl/2)
        for i=1, n do
            tbl[i], tbl[#tbl-i+1] = tbl[#tbl-i+1], tbl[i]
        end
    end

    ---sum
    ---@param tbl table
    ---@return number
    function table.sum(tbl)
        local sum = 0
        for i=1, #tbl do
            sum = sum + tbl[i]
        end
        return sum
    end

    ---cumsum
    ---@param tbl table
    ---@return table
    function table.cumsum(tbl)
        local cs = {}
        local sum = 0
        for i=1, #tbl do
            sum = sum + tbl[i]
            cs[i] = sum
        end
        return cs
    end

    ---max
    ---@param tbl table
    ---@return table
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

    ---min
    ---@param tbl table
    ---@return table
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

    ---argmax
    ---@param tbl table
    ---@return table
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

    ---argmin
    ---@param tbl table
    ---@return table
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

    
    ---add
    ---@param tbl table
    ---@param val number
    ---@return table
    function table.add(tbl, value)
          for i=1, #tbl do
            tbl[i] = tbl[i] + val
          end
        return tbl
    end

    
    ---subtract
    ---@param tbl table
    ---@param val number
    ---@return table
    function table.subtract(tbl, val)
        for i=1, #tbl do
            tbl[i] = tbl[i] - val
        end
        return tbl
    end

    
    ---multiply
    ---@param tbl table
    ---@param val number
    ---@return table
    function table.multiply(tbl, val)
        for i=1, #tbl do
            tbl[i] = tbl[i] * val
        end
        return tbl
    end
    

    ---divide
    ---@param tbl table
    ---@param val number
    ---@return table
    function table.divide(tbl, val)
        for i=1, #tbl do
            tbl[i] = tbl[i] / val
        end
        return tbl
    end

    ---slice
    ---@param tbl table
    ---@param pos_start number
    ---@param pos_end number
    function table.slice(tbl, pos_start, pos_end)
        local slice = {}
        local length = pos_end - pos_start + 1
        local _pos_start = pos_start - 1
        for i = 1, length do
            slice[i] = tbl[_pos_start + i]
        end
        return slice
    end

    ---copy
    ---@param tbl table
    ---@return table
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

    ---is_sorted
    ---@param tbl table
    ---@return boolean
    function table.is_sorted(tbl)
        for i = 2, #tbl do
            if tbl[i - 1] >= tbl[i] then
                return false
            end
        end
        return true
    end

    ---move
    ---@param tbl table
    ---@param pos_start number
    ---@param pos_end number
    ---@param pos_to number
    ---@param tbl_to table
    ---@return table
    function table.move(tbl, pos_start, pos_end,  pos_to, tbl_to)
        tbl_to = tbl_to or tbl
        pos_to = pos_to or 1
        
        local offset = pos_to - pos_start -- перекрытие регионов
        if offset > 0 then
            for i = pos_end, pos_start, -1 do
                tbl_to[i + offset] = tbl[i]
            end
        else
            for i = pos_start, pos_end do
                tbl_to[i + offset] = tbl[i]
            end
        end
        return tbl_to
    end

    ---fill
    ---@param tbl table
    ---@param value number
    ---@param pos_start number
    ---@param pos_end number
    function table.fill(tbl, value, pos_start, pos_end)
        if pos_end == nil then pos_start, pos_end = 1, pos_start or #tbl end
        if type(value) == "number" then
            for i = pos_start, pos_end do
                tbl[i] = value
            end
        else
            for i = pos_start, pos_end do
                tbl[i] = value()
            end
        end
    end
    
    ---get
    ---@param tbl table
    ---@param idx number
    ---@return any
    function table.get(tbl, idx)
        return tbl[idx]
    end


    ---get_random
    ---@param tbl table
    ---@return any
    function table.get_random(tbl)
        if #tbl == 0 then return nil end
        return tbl[math.random(1, #tbl)]
    end

    
    function table.get_meta_compatible(tbl,...)
        local tbls = {tbl, ...}
        if #tbls == 1 then tbls = {table.unpack(tbl)} end
        
        local meta = getmetatable(tbls[1])
        for i = 1, #tbls do
            meta = meta or getmetatable(tbls[i])
            local compare_meta = getmetatable(tbls[i]) or meta
            if meta ~= compare_meta then
                print("Ошибка: метатаблицы не совместимы")
                return false
            end
        end
        return meta or getmetatable(tbl)
    end

    
    function table.merge(tbl, ...)
        if tbl == nil then return nil end
        -- try to set common metatable
        local meta = table.get_meta_compatible(tbl,...)
        if meta == false then return nil end
        local merge = setmetatable({}, meta)
        --
        local tbls = {tbl, ...}
        if #tbls == 1 then tbls = tbl end
        --
        local k = 1
        for i = 1, #tbls do
            local tbl = tbls[i]
            if type(tbl) == "table" then
                table.move(tbls[i], 1, #tbls[i], k, merge)
                k = k + #tbls[i]
            elseif tbl then
                merge[k] = tbl
                k = k + 1
            end
        end
        
        return merge
    end
end
