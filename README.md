# MT API Extended

Extends the Minetest API to include some common functions and even an API response protocol

> This mod also includes some utility functions that affect the Lua environment (such as adding a few utilities to string)

## Included:

* Strings split (Splits a string by given separator, returning a table of strings)
* Strings contains (Checks if a string is within another string, returns boolean)
* Strings firstToUpper (Converts only the first letter in a string to uppercase)
* API functions that return success, error message, value in a table (See MT API section)
* Math getPercent (Returns percentage given current and max)
* Table containsValue (Checks if one of the values in the table is the given value, returns boolean)
* Table containsKey (Checks if one of the keys in the table is the given key, returns boolean)
* Table keys (Returns a table of the given table's keys)
* Table len (Returns the size of the table based on number of keys or elements)
* And more to come

## MT API

> This api is useful for standardizing responses in apis

In `mtapi` we have primarily 2 functions (with various aliases to each of them) to attempt to control tables in a standard way

### Make Response

Given a status (boolean), a errormessage (prefered string, can be left nil to set to blank string), and a returnvalue (can be anything, if you don't need to return something use nil)

Returns a table of success, errmsg, and value

Examples:

```lua
-- An example of a function returning a mtapi common api response table
local example1 = function(filename)
    return mtapi.mkresponse(true, nil, filename..".lua")
    -- Or to translate the direct code
--  return {success=true, errmsg="", value=filename..".lua"}
end

-- An example of a function which returns the players name, position and direct ObjectRef to the player (given player by objectref or string)
-- This function's value will either be nil or a table
local example2 = function(player)
    -- If the player was given by name
    if type(player) == "string" then
        -- Attempt to convert to ref
        player = minetest.get_player_by_name(player) or nil
    end
    -- If player is either given invalid or is now invalid
    if player == nil then
        -- Return that we failed
        -- Notice I use one of the shorthand aliases
        return mtapi.mkresp(false, "Player not online", nil)
    end
    -- If we get here then we are successful
    local name = player:get_player_name() -- Get name
    local pos = player:get_pos() -- Get position
    -- Return successful and return the data/payload
    return mtapi.mkresp(true, nil, {name=name, pos=pos, ref=player})
end
```

Shorthands / Aliases:

* mkresponse
* makeresponse
* mkresp

### Ok Response

Given a mtapi common API response table (or your own formed the same way), checks if it was successful, returns a boolean to indicate valid/successful

Examples:

```lua
-- Reusing example1 and example2 from Make Response section
local returncode = example1("my_file")
if not mtapi.okresponse(returncode) then
    minetest.log("action", returncode.errmsg)
    -- Since example1 always returns a successful status this will never be called
else
    minetest.log("action", returncode.value)
    -- "my_file.lua" (If you were wondering)
end

local rc = example2("singleplayer")
if not mtapi.okresp(rc) then -- This could also be "if not rc.success then" (Directly accessing the table)
    minetest.log("action", rc.errmsg)
    -- This could occur if there is not a player called singleplayer online
    -- In which rc.errmsg would be "Player not online"
else
    local payload = rc.value -- Assign the table of our response to a variable
    -- rc.value should be {name="singleplayer", pos={x=0, y=0, z=0}, ref=ObjectRef}
    -- Assuming position was (0, 0, 0)
    minetest.log("action", "Player '"..payload.name.."' is at "..minetest.pos_to_string(payload.pos)..".")
    -- Player 'singleplayer' is at (0, 0, 0).
    -- Assuming position was (0, 0, 0)
end
```

Shorthands / Aliases:

* okresponse
* okayresponse
* okresp
* okayresp
