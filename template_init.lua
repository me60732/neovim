-- Auto-load all Lua files in this directory (excluding init.lua)
local mod_dir = ...
local dir_path = vim.fn.stdpath("config") .. "/lua/" .. mod_dir
for _, file in ipairs(vim.fn.globpath(dir_path, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    pcall(require, mod_dir .. "." .. name)
  end
end

