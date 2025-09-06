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
  {
    "OXY2DEV/markview.nvim",
    opts = function()
      return require "configs.md"
    end,
    lazy = false,
    priority = 44,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = function()
      return require "configs.neotree"
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup {
        hint = "floating-letter",
        show_prompt = false,
        filter_rules = {
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "NvimTree", "neo-tree", "notify", "snacks_notif" },

            -- if the file type is one of following, the window will be ignored
            buftype = {}, --{ "terminal" },
          },
        },
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      return require "configs.notify"
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- animate = { enabled = true },
      bigfile = { enabled = true },
      indent = { enabled = true },
      bufdelte = { enable = true },
      -- lazygit = { enabled = true },
      scroll = { enabled = true },
      words = { enabled = true },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      return require "configs.telescope"
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },
  {
    "folke/trouble.nvim",
    opts = function()
      return require "configs.trouble"
    end,
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
    -- Optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_ui_method = {
        conform = "nvim",
        input = "nvim",
        select = "nvim",
      }
      vim.g.vimtex_log_ignore = {
        "Treesitter",
      }
      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        spacing = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 0,
        styles = 1,
      }
      vim.o.conceallevel = 2
      vim.o.concealcursor = "nc"
      -- vim.g.vimtex_compiler_method = "latexmk"
      -- vim.g.vimtex_compiler_latexmk = {
      -- options = {
      -- "-xelatex",
      -- "-file-line-error",
      -- "-interaction=nonstopmode",
      -- "-synctex=1",
      -- },
      -- }
    end,
    config = function()
      return require "configs.vimtex"
    end,
  },
}
