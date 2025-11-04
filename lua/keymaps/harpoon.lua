-- keymaps/harpoon.lua

-- Safely require Harpoon (in case it's not installed yet)
local ok, harpoon = pcall(require, "harpoon")
if not ok then
  vim.notify("Harpoon not available", vim.log.levels.WARN)
  return
end

-- Keymap: Add current file to Harpoon
vim.keymap.set("n", "<leader>a", function()
  harpoon.mark.add_file()
end, { desc = "Harpoon mark file" })

-- Keymap: Toggle Harpoon quick menu
vim.keymap.set("n", "<leader>h", function()
  harpoon.ui.toggle_quick_menu()
end, { desc = "Harpoon menu" })

-- Keymaps: Navigate to Harpoon files
vim.keymap.set("n", "<leader>1", function()
  harpoon.ui.nav_file(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<leader>2", function()
  harpoon.ui.nav_file(2)
end, { desc = "Harpoon file 2" })

