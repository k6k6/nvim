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
    -- opts = function()
    -- require "configs.lsp"
    -- return {}
    -- end,
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
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

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
    "nvim-mini/mini.pairs",
    version = false,
    event = "BufEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "nvim-mini/mini.surround",
    version = false,
    event = "InsertEnter",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    enabled = false,
    event = "BufEnter",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- enabled=false,
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ft = "markdown",
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        position = "inline",
        signs = { "󰌕", "󰌖", "", "", "", "", "" },
        backgrounds = {},
      },
      indent = {
        enabled = true,
        icon = " ",
      },
      bullet = {
        left_pad = 1,
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    opts = function()
      return require "configs.md"
    end,
    lazy = false,
    priority = 44,
  },
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
      vim.g.mkdp_filetypes = { "markdown" }
      -- vim.g.mkdp_browser = "zen-browser"
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
      bufdelte = { enabled = true },
      -- image = { enabled = true },
      -- lazygit = { enabled = true },
      -- scroll = { enabled = true },
      words = { enabled = true },
    },
  },
  {
    "3rd/image.nvim",
    -- enabled = false,
    build = false,
    event = "VeryLazy",
    opts = {
      backend = "sixel",
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = false,
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = "inline",
          -- floating_windows = true,
        },
      },
    },
    -- config = function()
    -- require("image").setup {
    -- backend = "sixel",
    -- }
    -- end,
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
    opts = function()
      return require "configs.dropbar"
    end,
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
      vim.g.vimtex_view_general_viewer = "llpp"
      -- vim.g.vimtex_view_general_options = "-remote /tmp/llpp.remote @pdf"
      -- vim.g.vimtex_view_method = "zathura"
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
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-xelatex",
        pdfdvi = "-pdfdvi",
        pdfps = "-pdfps",
        pdflatex = "-pdf",
        luatex = "-lualatex",
        lualatex = "-lualatex",
        xelatex = "-xelatex",
      }
    end,
    config = function()
      return require "configs.vimtex"
    end,
  },
}
