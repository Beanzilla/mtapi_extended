
mtapi.getPercent = function (current, max)
    if max == nil then
        max = 100.0
    end
    return math.round( (current / max) * 100.0 )
end
