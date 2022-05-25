
-- Given a table and an element look for if the table's values contains element
table.containsValue = function (t, element)
    for key, value in pairs(t) do
        if value == element then
            return true
        end
    end
    return false
end

-- Given a table and an element look for if the table's keys contains element
table.containsKey = function (t, element)
    for key, value in pairs(t) do
        if key == element then
            return true
        end
    end
    return false
end

-- Given a table returns it's keys (Returns a table)
table.keys = function (t)
    local keys = {}
    for k, v in pairs(t) do
        table.insert(v)
    end
    return keys
end

-- Given a table returns the size based on number of keys/elements
table.len = function (t)
    local size = 0
    for k in ipairs(t) do
        size = size + 1
    end
    return size
end
