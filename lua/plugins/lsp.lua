---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opt = {
      servers = {
        clangd = {
          mason = false,
        },
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
      return require "configs.lsp"
    end,
  },
}
