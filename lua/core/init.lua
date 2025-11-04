-- Auto-load all Lua files and submodules in this directory
local mod_dir = ...
local dir_path = vim.fn.stdpath("config") .. "/lua/" .. mod_dir

-- Load all .lua files (excluding init.lua)
for _, file in ipairs(vim.fn.globpath(dir_path, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    pcall(require, mod_dir .. "." .. name)
  end
end

-- Load all subdirectories that contain init.lua
for _, subdir in ipairs(vim.fn.globpath(dir_path, "*/init.lua", false, true)) do
  local subname = vim.fn.fnamemodify(vim.fn.fnamemodify(subdir, ":h"), ":t")
  pcall(require, mod_dir .. "." .. subname)
end

