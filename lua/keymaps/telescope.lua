local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fu", builtin.undo, { desc = "Undo history" })
vim.keymap.set("n", "<leader>fz", function()
  require("telescope").extensions.zoxide.list()
end, { desc = "Zoxide jump" })
vim.keymap.set("n", "<leader>fc", function()
  require("telescope").extensions.neoclip.default()
end, { desc = "Clipboard history" })

