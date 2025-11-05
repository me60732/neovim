local builtin = require("telescope.builtin")

-- 🔍 Find files in your project (uses ripgrep or fd if available)
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })

-- 🔎 Search for text across files (live grep)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

-- 📂 Switch between open buffers
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })

-- 📚 Search Neovim help docs
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

-- 🕰️ Browse undo history (requires telescope-undo extension)
vim.keymap.set("n", "<leader>fu", builtin.undo, { desc = "Undo history" })

-- 📁 Jump between directories using Zoxide (requires telescope-zoxide)
vim.keymap.set("n", "<leader>fz", function()
  require("telescope").extensions.zoxide.list()
end, { desc = "Zoxide jump" })

-- 📋 View clipboard history (requires neoclip)
vim.keymap.set("n", "<leader>fc", function()
  require("telescope").extensions.neoclip.default()
end, { desc = "Clipboard history" })

