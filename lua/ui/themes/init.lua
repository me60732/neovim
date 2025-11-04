-- Load all theme modules into THEMES table
THEMES = {}
local mod_dir = ...
local dir_path = vim.fn.stdpath("config") .. "/lua/" .. mod_dir

for _, file in ipairs(vim.fn.globpath(dir_path, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    local ok, theme = pcall(require, mod_dir .. "." .. name)
    if ok and type(theme) == "table" and theme.name and theme.activate then
      THEMES[theme.name] = theme.activate
    end
  end
end

