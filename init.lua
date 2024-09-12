do
    table = table or {}
    ----------------- API ----------------------------------------
    ---insert
    ---@param tbl table
    ---@param value number
    ---@return table
    function table.insert(tbl, value) end

    ---insert
    ---@param tbl table
    ---@param pos number
    ---@param value number
    ---@return table
    function table.insert(tbl, pos, value) end

    ---unpack
    ---@param tbl table
    ---@param start_pos number
    ---@param end_pos number
    function table.unpack(tbl, start_pos, end_pos) end

    ---pack
    ---@param
    ---@return table
    function table.pack(...) end

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
    -------------------- Planning -----------------------------------
    -- sort = function(tbl, f, method) end -- "require sorts"
    ---@param tbl table
    ---@return boolean
    table.any = function(tbl) end
    --@param tbl table
    --@return boolean
    -- table.all = function(tbl)  end
    -- table.mean
    -- table.getn
    -- swap
    ------------- maybe planning ------------------------------------
    -- function table.get_random(tbl) end
    -- function table.swap(tbl, i, j)
    -- table.remove_swap_back(tbl)
    -- table.insert_swap_back(tbl, i)
    -----------------------------------------------------------------
end