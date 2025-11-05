local M = {}

M.write_ignore_file = function(exclude, ignore)
  local ignore_path = vim.fn.getcwd() .. "/.spectre_ignore"
  local lines = {}

  -- Add exclude paths
  if exclude and exclude ~= "" then
    for path in string.gmatch(exclude, "[^,%s]+") do
      table.insert(lines, path)
    end
  end

  -- Add ignore patterns
  if ignore and ignore ~= "" then
    for pattern in string.gmatch(ignore, "[^,%s]+") do
      table.insert(lines, pattern)
    end
  end

  -- Overwrite the file
  local file = io.open(ignore_path, "w")
  if file then
    file:write(table.concat(lines, "\n"))
    file:close()
  else
    vim.notify("Failed to write .spectre_ignore", vim.log.levels.ERROR)
  end

  -- Schedule cleanup on exit
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      if vim.fn.filereadable(ignore_path) == 1 then
        os.remove(ignore_path)
      end
    end,
  })
end

return M

