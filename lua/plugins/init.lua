return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
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
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      -- 用 nvim-cmp 官方的 bordered 帮助函数，并指定圆角
      opts.window = {
        completion = cmp.config.window.bordered { border = "rounded" },
        documentation = cmp.config.window.bordered { border = "rounded" },
      }
      return opts
    end,
  },
}
