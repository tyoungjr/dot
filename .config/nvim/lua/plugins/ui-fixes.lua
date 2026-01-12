-- Fix for shell crash with noice.nvim cmdline on nvim 0.11 + Kitty
-- Disable noice entirely - use snacks for notifications instead
return {
  -- Disable noice completely - causes crash/invisible cmdline
  { "folke/noice.nvim", enabled = false },

  -- Enable snacks notifier as replacement for noice notifications
  -- Disable snacks explorer - using neo-tree instead
  {
    "folke/snacks.nvim",
    opts = {
      notifier = { enabled = true },
      input = { enabled = false },
      explorer = { enabled = false },  -- Use neo-tree instead
    },
  },
}
