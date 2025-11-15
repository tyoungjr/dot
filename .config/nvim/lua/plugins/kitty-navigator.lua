return {
  "knubie/vim-kitty-navigator",
  build = "cp ./*.py ~/.config/kitty/",
  config = function()
    vim.g.kitty_navigator_no_mappings = 1
    vim.keymap.set("n", "<C-h>", ":KittyNavigateLeft<CR>", { silent = true })
    vim.keymap.set("n", "<C-j>", ":KittyNavigateDown<CR>", { silent = true })
    vim.keymap.set("n", "<C-k>", ":KittyNavigateUp<CR>", { silent = true })
    vim.keymap.set("n", "<C-l>", ":KittyNavigateRight<CR>", { silent = true })
  end,
}
