-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Respect .editorconfig settings
vim.g.editorconfig = true

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false

-- File encoding
vim.opt.fileencoding = "utf-8"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Backup and swap
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

-- Ignore build artifacts and dependencies
vim.opt.wildignore:append({
  "*/build/*",
  "*/thirdparty/*",
  "*/node_modules/*",
  "*.bundle",
  "*.dll",
  "*.so",
  "*.dylib",
  "*.o",
  "*.obj",
})
