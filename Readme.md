Раширенная библитека таблиц. Библитека написанна для Warcraft 3 reforged.

Клонируйте репозиторий в свой проект:
```
git clone https://github.com/Kolad2/war3-lua-table.git table
```

Текущий программный интерфейс - API
```lua
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
```

Related and useful links:
- xlua https://github.com/torch/xlua/tree/master
- lua-set https://github.com/wscherphof/lua-set/tree/master
- LuaSortingAlgorithms https://github.com/DervexDev/LuaSortingAlgorithms
- cheapack https://github.com/nazarpunk/cheapack
- imp-lua-mm https://github.com/Indaxia/imp-lua-mm
- luaforwindows https://github.com/rjpcomputing/luaforwindows