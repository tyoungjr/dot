-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Close certain filetypes with 'q'
autocmd("FileType", {
  group = augroup("CloseWithQ", { clear = true }),
  pattern = { "qf", "help", "man", "lspinfo" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto-format on save (disabled)
-- Uncomment to enable auto-format on save
-- autocmd("BufWritePre", {
--   group = augroup("AutoFormat", { clear = true }),
--   pattern = "*.cpp,*.h,*.cs,*.py,*.js,*.proto,*.cmake",
--   callback = function()
--     require("conform").format({ async = false, lsp_fallback = true })
--   end,
-- })

-- CMake file detection
autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("CMakeFiles", { clear = true }),
  pattern = { "CMakeLists.txt", "*.cmake" },
  callback = function()
    vim.bo.filetype = "cmake"
  end,
})

-- Generate compile_commands.json on CMake save
autocmd("BufWritePost", {
  group = augroup("CMakeGenerate", { clear = true }),
  pattern = "CMakeLists.txt",
  callback = function()
    vim.notify("Regenerating CMake project...", vim.log.levels.INFO)
    vim.fn.system("cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON")
  end,
})
