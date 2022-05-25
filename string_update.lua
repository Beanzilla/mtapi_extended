
-- Splits input by given seperator
string.split = function (input, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(input, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

-- Checks if a string is in the given input
string.contains = function (input, find)
    if string.match(input, find) then
        return true
    end
    return false
end

-- Capitalizes the first letter of a string
string.firstToUpper = function (input)
    return (input:gsub("^%l", string.upper))
end
