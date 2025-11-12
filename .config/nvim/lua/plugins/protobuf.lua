return {
  -- Treesitter for protobuf
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "proto" })
    end,
  },

  -- LSP for protobuf
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bufls = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "buf.yaml",
              "buf.work.yaml",
              ".git"
            )(fname)
          end,
        },
      },
    },
  },

  -- Protobuf formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        proto = { "buf" },
      },
    },
  },

  -- Auto-commands for proto files
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "proto",
        callback = function()
          vim.opt_local.commentstring = "// %s"
          vim.opt_local.expandtab = true
          vim.opt_local.shiftwidth = 2
          vim.opt_local.tabstop = 2
        end,
      })
    end,
  },
}
