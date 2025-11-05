vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
--local cwd = vim.fn.getcwd()
--vim.cmd("cd " .. cwd) -- set working directory when loading nvim ./
-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10


