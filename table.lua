

function table_create()
    local table = {}

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

    function table.unpack(tbl, start_pos, end_pos)
        start_pos = start_pos or 1
        end_pos = end_pos or #tbl
        if start_pos <= end_pos then
            return tbl[i], table.unpack(tbl, start_pos + 1, end_pos)
        end
    end

    function table.pack(...)
        return { ... }
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
        return slice
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

    function table.is_sorted(tbl)
        for i = 2, #tbl do
            if tbl[i - 1] >= tbl[i] then
                return false
            end
        end
        return true
    end


    function table.move(tbl, pos_start, pos_end, tbl_to, pos_to)
        if type(tbl_to) ~= "table" then
            tbl_to = tbl
            pos_to = tbl_to
        end

        t = t + e

        for i = pos_start, pos_end, -1 do
            a2[t] = a1[i]
        end

        return tbl_to
    end
end