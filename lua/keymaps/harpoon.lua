local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
  harpoon.mark.add_file()
end, { desc = "Harpoon mark file" })

vim.keymap.set("n", "<leader>h", function()
  harpoon.ui.toggle_quick_menu()
end, { desc = "Harpoon menu" })

vim.keymap.set("n", "<leader>1", function()
  harpoon.ui.nav_file(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<leader>2", function()
  harpoon.ui.nav_file(2)
end, { desc = "Harpoon file 2" })

