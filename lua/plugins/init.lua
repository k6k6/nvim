return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufEnter",
    opts = require "configs.treesitter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    enable = false,
  },
}
