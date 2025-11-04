local theme_file = vim.fn.stdpath("config") .. "/.last_theme"
local last_theme = vim.fn.filereadable(theme_file) == 1 and vim.fn.readfile(theme_file)[1] or nil

-- Activate last-used theme
if last_theme and THEMES[last_theme] then
  THEMES[last_theme]()
end

-- Dynamically assign <leader><F1> to <leader><F12>
for i, name in ipairs(vim.tbl_keys(THEMES)) do
  if i <= 12 then
    local key = "<leader><F" .. i .. ">"
    vim.keymap.set("n", key, function()
      THEMES[name]()
      vim.fn.writefile({ name }, theme_file)
    end, { desc = "Switch to theme: " .. name })
  end
end

