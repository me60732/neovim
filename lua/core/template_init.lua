local mod_dir = ...
local dir_path = vim.fn.stdpath("config") .. "/lua/" .. mod_dir

local collected = {}

-- Load all .lua files (excluding init.lua)
for _, file in ipairs(vim.fn.globpath(dir_path, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    local ok, mod = pcall(require, mod_dir .. "." .. name)
    if ok and mod ~= nil then
      if type(mod) == "table" then
        table.insert(collected, mod)
      elseif type(mod) == "function" then
        table.insert(collected, mod())
      end
    end
  end
end

-- Load all subdirectories that contain init.lua
for _, subdir in ipairs(vim.fn.globpath(dir_path, "*/init.lua", false, true)) do
  local subname = vim.fn.fnamemodify(vim.fn.fnamemodify(subdir, ":h"), ":t")
  local ok, mod = pcall(require, mod_dir .. "." .. subname)
  if ok and mod ~= nil then
    if type(mod) == "table" then
      table.insert(collected, mod)
    elseif type(mod) == "function" then
      table.insert(collected, mod())
    end
  end
end

return collected

