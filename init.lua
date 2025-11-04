-- Auto-load all top-level Lua modules (files and directories with init.lua)
local config_dir = vim.fn.stdpath("config") .. "/lua"
for _, path in ipairs(vim.fn.globpath(config_dir, "*", false, true)) do
  local name = vim.fn.fnamemodify(path, ":t")
  local is_lua = name:match("%.lua$")
  local mod_name = is_lua and name:gsub("%.lua$", "") or name

  local full_path = config_dir .. "/" .. name
  local is_dir = vim.fn.isdirectory(full_path) == 1
  local has_init = is_dir and vim.fn.filereadable(full_path .. "/init.lua") == 1

  if is_lua or has_init then
    pcall(require, mod_name)
  end
end

