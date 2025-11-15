return {
  -- Treesitter for CMake
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "cmake" })
    end,
  },

  -- LSP for CMake
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cmake = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "CMakePresets.json",
              "CMakeLists.txt",
              ".git"
            )(fname)
          end,
        },
      },
    },
  },

  -- CMake formatting (disabled)
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       cmake = { "cmake_format" },
  --     },
  --     formatters = {
  --       cmake_format = {
  --         prepend_args = { "--tab-size=4" }, -- Use 4 spaces to match .editorconfig
  --       },
  --     },
  --   },
  -- },
}
