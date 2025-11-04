-- ~/.config/nvim/init.lua

-- Load Lazy.nvim last
require("core.lazy")
-- Recursively load everything under lua/
local modules = require("core.template_init")("")

for _, mod in ipairs(modules) do
  if type(mod) == "function" then
    mod()
  elseif type(mod) == "table" and mod.setup then
    mod.setup()
  end
end



