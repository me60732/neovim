local config_dir = vim.fn.stdpath("config") .. "/lua/config"
for _, file in ipairs(vim.fn.globpath(config_dir, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    require("config." .. name)
  end
end

