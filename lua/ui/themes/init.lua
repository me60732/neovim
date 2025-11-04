THEMES = THEMES or {}

local lazy_dir = vim.fn.stdpath("data") .. "/lazy"
local entries = vim.fn.globpath(lazy_dir, "*", false, true)

for _, path in ipairs(entries) do
  local name = vim.fn.fnamemodify(path, ":t")

  THEMES[name] = function()
    vim.g.active_theme = name

    local ok, mod = pcall(require, name)
    if ok and type(mod) == "table" and type(mod.setup) == "function" then
      local config_ok, config = pcall(require, "ui.themes.config." .. name)
      if config_ok and type(config) == "table" then
        pcall(mod.setup, config)
      else
        pcall(mod.setup, {}) -- fallback to empty setup
      end
    end

    vim.cmd.colorscheme(name)
  end
end

