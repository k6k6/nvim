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
}
