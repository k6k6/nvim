return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePre",
    config = function()
      require "configs.lint"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = require "configs.treesitter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
}
