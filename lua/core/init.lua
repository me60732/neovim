-- Auto-load all Lua files in core/
local core_dir = vim.fn.stdpath("config") .. "/lua/core"
for _, file in ipairs(vim.fn.globpath(core_dir, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    require("core." .. name)
  end
end

