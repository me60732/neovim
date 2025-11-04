return function()
  local themes = vim.tbl_keys(THEMES)
  vim.ui.select(themes, { prompt = "Select Theme" }, function(choice)
    if choice then
      THEMES[choice]()
      vim.fn.writefile({ choice }, vim.fn.stdpath("config") .. "/.last_theme")
    end
  end)
end

