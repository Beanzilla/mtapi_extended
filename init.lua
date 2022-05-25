
mtapi = {}
mtapi.version = "1.0-dev"

local filedo = function (dir, filename)
    local modpath = minetest.get_modpath("mtapi_extended")
    if filename == nil then
        dofile(modpath .. DIR_DELIM .. dir .. ".lua")
    else
        dofile(modpath .. DIR_DELIM .. dir .. DIR_DELIM .. filename .. ".lua")
    end
end

-- Updates string to include split and other useful string operations
-- Adds to string
filedo("string_update")

-- Adds a potential api response table
-- Adds to mtapi
filedo("api")

-- Functions to calculate percentages given current and max values
-- Adds to math
filedo("percent")

-- Updates table to include containsValue, containsKey, keys and other useful table operations
-- Adds to table
filedo("table_update")
