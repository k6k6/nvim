---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      servers = {
        ruff_lsp = false,
        -- clangd = {
        --   mason = false,
        -- },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = function()
      require "configs.lsp"
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
      return opts
    end,
  },
}
