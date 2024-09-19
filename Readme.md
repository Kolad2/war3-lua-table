


# Разширенная библитека таблиц table

![](logo/horizontal.svg)

Данная библитека table расширяет возможности текущей версии одноименной библеотеки в Warcraft 3 reforged.
Warcraft 3 reforged 1.36 содержит в lua библитеки table по умолчанию следующие ключи:
```lua
table = {"unpack", "insert", "pack", "sort", "concat", "move", "remove", "unpack"}
```
Функции работают в соответствии с [мануалом](https://www.lua.org/manual/5.4/manual.html#6.6). 
Список всех поддерживаемых функций библитеки репозитория расположен в разделе программного интерфейса - API.

Клонируйте репозиторий в свой проект:
```cmd
git clone https://github.com/Kolad2/war3-lua-table.git table
```

## Текущий программный интерфейс (API) модуля table

```lua
---insert
---@param tbl table
---@param value number
---@return table
function table.insert(tbl, value) end

---insert
---@param tbl table
---@param pos number
---@param value number|nil
---@return table
function table.insert(tbl, pos, value) end

---unpack
---@param tbl table
---@param start_pos number
---@param end_pos number
function table.unpack(tbl, start_pos, end_pos) end

---tostring
---@param tbl table|number
function table.tostring(tbl) end

---remove
---@param tbl table
---@param tbl number|nil
---@return any
function table.remove(tbl, idx) end

---remove_swap
---@param tbl table
---@param idx number
---@return any
function table.remove_swap(tbl, idx) end

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

---argmax
---@param tbl table
---@return number
function table.argmax(tbl) end

---argmin
---@param tbl table
---@return table
function table.argmin(tbl) end

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

---is_sorted
---@param tbl table
---@return boolean
function table.is_sorted(tbl) end

---move
---@param tbl table
---@param pos_start number
---@param pos_end number
---@param tbl_to table|number
---@param pos_to number|nil
function table.move(tbl, pos_start, pos_end, tbl_to, pos_to) end

---fill
---@param tbl table
---@param value number
---@param pos_start number
---@param pos_end number
function table.fill(tbl, value, pos_start, pos_end) end

---@return table
function table.empty() end

---get
---@param tbl table
---@param idx number
---@return any
function table.get(tbl, idx) end

---get_random
---@param tbl table
---@return any
function table.get_random(tbl) end
```

# Модуль table.sorts

Модуль является адаптацией [репозитория](https://github.com/DervexDev/LuaSortingAlgorithms)
конвертированных из python алгоритмов сортировки. 

Следующие алгоритмы поддерживают дробные числа:
* Cycle Sort
* Gnome Sort
* Circle Sort
* Cocktail Sort
* Comb Sort
* Bubble Sort
* ShellSort
* Stooge Sort
* Heap Sort
* Insertion Sort
* Merge Sort
* Pancake Sort
* Pigeonhole Sort
* Quick Sort
* Bucket Sort - not recommended

# Использованные источники
- [lua-table](https://github.com/Luca96/lua-table/tree/master) - 
база функций расширяющих стандартный набор table c добавлением дополнительных свойств.
- [t-util](https://github.com/loominatrx/t-util/tree/main) - 
база функций расширяющих стандартный набор.
- [xlua](https://github.com/torch/xlua/tree/master) - база функций расширяющих стандартный набор.
- [table-manual](https://www.lua.org/manual/5.4/manual.html#6.6) - 
официальный мануал по таблицам.
- [LuaSortingAlgorithms](https://github.com/DervexDev/LuaSortingAlgorithms) - 
репозиторий конвертированных из python алгоритмов сортировки.
- [MDTable](https://www.hiveworkshop.com/threads/multidimensional-table.353717/) - класс мульти таблиц

# Полезные источники
- lua-set https://github.com/wscherphof/lua-set/tree/master
- [cheapack](https://github.com/nazarpunk/cheapack) - 
совсем не дешевый упаковщик *.lua файлов в *.wct файл Warcraft 3.
- [imp-lua-mm](https://github.com/Indaxia/imp-lua-mm)
- [luaforwindows](https://github.com/rjpcomputing/luaforwindows) - 
репозиторий хранящий Lua.exe файл для windows
