local M = {}

-- Simple wrapper around vim.ui.input
M.prompt = function(label, default, callback)
  vim.ui.input({ prompt = label, default = default or "" }, function(input)
    if input == nil then return end
    callback(input)
  end)
end

return M

