do
    ---@class deque
    ---@overload fun(max_size:integer): deque
    deque = deque or {}

    --- Возвращает текущее количество элементов в очереди
    ---@return integer
    function deque:size()
        local obj = self
        if obj._head == 0 then
            return 0
        elseif obj._head <= obj._tail then
            return obj._max_size - obj._tail + obj._head + 1
        else
            return obj._head - obj._tail + 1
        end
    end

    --- Проверяет, пуста ли очередь
    ---@return boolean
    function deque:is_empty()
        return self._head == 0
    end

    --- Проверяет, заполнена ли очередь
    ---@return boolean
    function deque:is_full()
        return self._max_size == self:size()
    end

    --- Добавляет элемент в начало очереди
    ---@param item any
    ---@return boolean
    function deque:push_front(item)
        if self:is_full() then
            return false
        end

        if self:is_empty() then
            self._head = 1
            self._tail = 1
        else
            self._head = self._head == self._max_size and 1 or self._head + 1
        end

        self[self._head] = item
        return true
    end

    --- Добавляет элемент в конец очереди
    ---@param item any
    ---@return boolean
    function deque:push_back(item)
        if self:is_full() then
            return false
        end

        if self:is_empty() then
            self._head = 1
            self._tail = 1
        else
            self._tail = self._tail == 1 and self._max_size or self._tail - 1
        end

        self[self._tail] = item
        return true
    end

    --- Удаляет и возвращает элемент из начала очереди
    ---@return any
    function deque:pop_front()
        if self:is_empty() then
            return nil
        end

        local item = self[self._head]
        self[self._head] = nil

        if self._head == self._tail then
            self._head = 0
            self._tail = 0
        else
            self._head = self._head == 1 and self._max_size or self._head - 1
        end

        return item
    end

    --- Удаляет и возвращает элемент из конца очереди
    ---@return any
    function deque:pop_back()
        if self:is_empty() then
            return nil
        end

        local item = self[self._tail]
        self[self._tail] = nil

        if self._head == self._tail then
            self._head = 0
            self._tail = 0
        else
            self._tail = self._tail == self._max_size and 1 or self._tail + 1
        end

        return item
    end

    --- Возвращает элемент из начала очереди без удаления
    ---@return any
    function deque:peek_front()
        if self:is_empty() then
            return nil
        end
        return self[self._head]
    end

    --- Возвращает элемент из конца очереди без удаления
    ---@return any
    function deque:peek_back()
        if self:is_empty() then
            return nil
        end
        return self[self._tail]  -- +1 потому что в Lua индексация с 1
    end

    --- Очищает очередь
    function deque:clear()
        if not self:is_empty() then
            local current = self._head
            repeat
                self[current + 1] = nil  -- +1 потому что в Lua индексация с 1
                if current == self._tail then
                    break
                end
                current = (current + 1) % self._max_size
            until false
        end
        self._head = 0
        self._tail = 0
    end

    deque.object_meta = {
        __index = deque,
        __len = function(deque) return deque:size() end,
        __tostring = function(deque)
            local result = "{"
            if not deque:is_empty() then
                local current = deque._head
                repeat
                    if #result > 1 then
                        result = result .. ", "
                    end
                    result = result .. tostring(deque[current])
                    if current == deque._tail then
                        break
                    end
                    current = (current + 1) % deque._max_size
                until false
            end
            result = result .. "}"
            return result
        end
    }

    --- Создаёт новую очередь с ограниченным размером
    ---@param max_size integer Максимальный размер очереди
    ---@return deque Новая очередь
    function deque:create(max_size)
        if not max_size or max_size <= 0 then
            print("Ошибка: Размер очереди должен быть положительным числом")
        end
        local obj = {} ---@type deque
        obj._max_size = max_size
        obj._head = 0
        obj._tail = 0
        return setmetatable(obj, self.object_meta)
    end

    setmetatable(deque, {__call = deque.create})
end