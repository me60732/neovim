-- Core keymaps
vim.g.mapleader = " "
local keymap = vim.keymap.set
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

