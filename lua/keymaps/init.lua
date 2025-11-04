-- Auto-load all Lua files in this directory
local keymaps_dir = vim.fn.stdpath("config") .. "/lua/keymaps"
local files = vim.fn.globpath(keymaps_dir, "*.lua", false, true)

for _, file in ipairs(files) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    require("keymaps." .. name)
  end
end

