# Раширенная библитека таблиц
Данная библитека table расширяет 
возможности текущей версии одноименной библеотеки в Warcraft 3 reforged.


Клонируйте репозиторий в свой проект:
```cmd
git clone https://github.com/Kolad2/war3-lua-table.git table
```

На данный момент Warcraft 3 reforged 1.36 в lua библитеке table по умолчанию присутствуют следующие ключи:
```lua
table = {"unpack", "insert", "pack", "sort", "concat", "move", "remove", "unpack"}
```


# Текущий программный интерфейс - API
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

# Использованные источники
- [lua-table](https://github.com/Luca96/lua-table/tree/master) - база функций расширяющих стандартный набор
table c добавлением дополнительных свойств.
- [t-util](https://github.com/loominatrx/t-util/tree/main) - база функций расширяющих стандартный набор.
- [xlua](https://github.com/torch/xlua/tree/master) - база функций расширяющих стандартный набор.

# Полезные источники
- lua-set https://github.com/wscherphof/lua-set/tree/master
- [LuaSortingAlgorithms](https://github.com/DervexDev/LuaSortingAlgorithms) - 
репозиторий конвертированных из python алгоритмов сортировки.
- [cheapack](https://github.com/nazarpunk/cheapack) - 
совсем не дешевый упаковщик *.lua файлов в *.wct файл Warcraft 3.
- imp-lua-mm https://github.com/Indaxia/imp-lua-mm
- [luaforwindows](https://github.com/rjpcomputing/luaforwindows) - 
репозиторий хранящий Lua.exe файл для windows