-- Load Lazy.nvim itself as a plugin first
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- Load Lazy.nvim plugin manually
require("lazy").setup({
  { "folke/lazy.nvim", version = false },
}, {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})

-- Load your plugin declarations
require("plugins")

