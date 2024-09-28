require "table.table"
require "table.ndarray"
require "table.grid"

Searcher2d = Searcher2d or {}

Searcher2d.__meta = {
    __index = Searcher2d
}

Searcher2d.create = function(cls, locations, xmin, xmax, ymin, ymax)
    local obj = setmetatable({}, cls.__meta)
    local cell_height = 1
    local cell_width = 1
    obj.grid = Grid(xmin, xmax, ymin, ymax, cell_width, cell_height)
    for _, item in ipairs(locations) do obj:insert(item) end
    return obj
end

function Searcher2d:insert(item)
    self.grid:insert(item.x, item.y, item)
end

function Searcher2d:is_in_box(item, xmin, xmax, ymin, ymax)
    local x, y = item.x, item.y
    return x > xmin and x <= xmax and
           y > ymin and y <= ymax
end

function Searcher2d:find_in_box(xmin, xmax, ymin, ymax)
    local i_min, j_min = self.grid:get_indices(xmin, ymin)
    local i_max, j_max = self.grid:get_indices(xmax, ymax)
    local cells = table.empty()
    for i = i_min, i_max do
        for j = j_min, j_max do
            table.insert(cells, self.grid.cells[i][j])
        end
    end

    local items = table.empty()
    for _, cell in ipairs(cells) do
        for _, item in ipairs(cell) do
            if self:is_in_box(item, xmin, xmax, ymin, ymax) then
                table.insert(items, item)
            end
        end
    end
    return items
end

setmetatable(Searcher2d,{ __call = Searcher2d.create})

local xmin = -10
local xmax = 10
local ymin = -10
local ymax = 10

tbl = {}

local pos_meta = {
    __tostring = function(obj)
        return "{x:"..string.format("%.1f", obj.x)..", "..
                "y:"..string.format("%.1f", obj.y).."}"
    end}

for i = 1, 1000 do
    local pos = setmetatable({},  pos_meta)
    pos.x = math.random() * (xmax - xmin) + xmin
    pos.y = math.random() * (ymax - ymin) + ymin
    table.insert(tbl, pos)
end



local searcher = Searcher2d(tbl, xmin, xmax, ymin, ymax)
items = searcher:find_in_box(-1,1,-1,1)

print(table.tostring(items))

