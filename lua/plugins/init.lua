return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
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
    "fasterius/simple-zoom.nvim",
    keys = {
      {
        "<leader>fs",
        function()
          require("simple-zoom").toggle_zoom()
        end,
        desc = "toggle fullscreen",
      },
    },
    opts = {
      hide_tabline = false,
    },
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      return require "configs.dap"
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      servers = {
        ruff_lsp = false,
      },
    },
    config = function()
      require "configs.lsp"
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {},
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "michaelb/sniprun",
    branch = "master",
    cmd = { "SnipRun", "SnipInfo" },
    build = "sh install.sh 1",
    config = function()
      require "configs.sniprun"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- enabled = false,
    dependencies = { "kdheepak/cmp-latex-symbols" },
    opts = function(_, opts)
      local cmp = require "cmp"
      require "snippets.init"
      opts.sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "async_path" },
        {
          name = "latex_symbols",
          option = {
            strategy = 2,
          },
        },
      }
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
      return opts
    end,
  },
  {
    "nvim-mini/mini.surround",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    enabled = false,
  },
  {
    "altermo/ultimate-autopair.nvim",
    -- enabled = false,
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    config = function()
      local ua = require "ultimate-autopair"
      local configs = { ua.extend_default {}, { profile = require("ultimate-autopair.experimental.cmpair").init } }
      ua.init(configs)
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- enabled=false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = "markdown",
    opts = require "configs.render-markdown",
  },
  -- {
  --   "OXY2DEV/markview.nvim",
  --   opts = function()
  --     return require "configs.markview"
  --   end,
  --   lazy = false,
  --   priority = 44,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    -- enabled = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    keys = {
      { "<leader>mk", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview", mode = "n" },
    },
    init = function()
      require "init.mkdp"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled=false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = require "configs.neotree",
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require "configs.windows-picker"
    end,
  }, -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "configs.noice",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require "configs.notify"
        end,
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = require "configs.snacks",
  },
  {
    "3rd/image.nvim",
    -- enabled = false,
    build = false,
    event = "VeryLazy",
    opts = require "configs.image",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      return require "configs.telescope"
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "folke/trouble.nvim",
    opts = require "configs.trouble",
    cmd = "Trouble",
    keys = {
      {
        "<leader>sd",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>sa",
        "<cmd>Trouble diagnostics toggle <cr>",
        desc = "All buffer Diagnostics (Trouble)",
      },
      {
        "<leader>sl",
        "<cmd>Trouble lsp toggle <cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "BufEnter",
    opts = require "configs.dropbar",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      require "init.vimtex"
    end,
  },
}
