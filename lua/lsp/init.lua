local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"
for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    require("lsp." .. name)
  end
end

