-- ui/prompts/theme_picker.lua

return function()
  -- Safely access THEMES table
  local themes = type(THEMES) == "table" and vim.tbl_keys(THEMES) or {}

  -- Bail out if THEMES is missing or empty
  if #themes == 0 then
    vim.notify("No themes available", vim.log.levels.WARN)
    return
  end

  vim.ui.select(themes, { prompt = "Select Theme" }, function(choice)
    if choice then
      THEMES[choice]()
      vim.fn.writefile({ choice }, vim.fn.stdpath("config") .. "/.last_theme")
    end
  end)
end

