do
    Grid = {}

    function Grid:get_indices(x, y)
        local j = math.floor((y - self.ymin) / self.cell_height) + 1
        local i = math.floor((x - self.xmin) / self.cell_width) + 1
        return i, j
    end

    function Grid:get_cell(x, y)
        local i, j = self:get_indices(x, y)
        return self.cells[i][j]
    end

    function Grid:insert(x, y, item)
        local cell = self:get_cell(x, y)
        table.insert(cell, item)
    end

    function Grid:get_neighbors(x, y)
        local neighbors = {}
        local i, j = self:get_indices(x, y)
        for di = -1, 1 do
            for dj = -1, 1 do
                local ni = i + di
                local nj = j + dj
                if (not (di == 0 and dj == 0)) and self:is_in_bounds(ni, nj) then --  and
                    local cell = self.cells[ni][nj]
                    if cell then
                        table.insert(neighbors, cell)
                    end
                end
            end
        end
        return neighbors
    end

    function Grid:is_in_bounds(i, j)
        return (j > 0 and j <= self.shape[1]) and (i >  0 and i <= self.shape[2])
    end

    function Grid:tostring()
        return self.cells:tostring()
    end



    local meta = {
        __index = Grid,
        __tostring = Grid.tostring
    }


    Grid = {}
    function Grid.create(cls, xmin, xmax, ymin, ymax, cell_width, cell_height)
        local grid = setmetatable({}, meta)
        grid.xmax = xmax
        grid.xmin = xmin
        grid.ymin = ymin
        grid.ymax = ymax
        grid.width  = xmax - xmin
        grid.height = ymax - ymin
        grid.cell_width  = cell_width
        grid.cell_height = cell_height
        grid.shape = {
            math.floor(grid.height / grid.cell_height + 1),
            math.floor(grid.width  / grid.cell_width  + 1)
        }
        grid.cells = NDArray(grid.shape):fill(table.empty)
        return grid
    end

    setmetatable(Grid,{__call = Grid.create})
end