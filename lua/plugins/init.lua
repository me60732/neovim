local function deep_flatten(tbl)
  local result = {}
  for _, item in ipairs(tbl) do
    if type(item) == "table" and item[1] and type(item[1]) == "string" then
      -- Looks like a plugin spec: { "plugin/name", ... }
      table.insert(result, item)
    elseif type(item) == "table" then
      -- Nested list: recurse
      for _, sub in ipairs(deep_flatten(item)) do
        table.insert(result, sub)
      end
    end
  end
  return result
end

local collected = require("core.loader")()
local specs = deep_flatten(collected)

--print("Flattened plugin specs:\n", vim.inspect(specs))
return specs


