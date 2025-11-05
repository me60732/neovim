-- 🧭 Open Spectre UI for global search & replace
vim.keymap.set("n", "<leader>sr", function()
  require("spectre").open()
end, { desc = "Open Spectre for search & replace" })

-- 🔎 Search for the word under cursor across files
vim.keymap.set("n", "<leader>sw", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word with Spectre" })

-- 📄 Search in current file only
vim.keymap.set("n", "<leader>sf", function()
  require("spectre").open_file_search()
end, { desc = "Search in current file with Spectre" })

