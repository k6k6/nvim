return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config
    opts = {
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      source_selector = {
        sources = { -- table
          {
            source = "filesystem", -- string
            display_name = " Files", -- string | nil
          },
          {
            source = "buffers", -- string
            display_name = " Buf", -- string | nil
          },
          {
            source = "git_status", -- string
            display_name = "󰊢 Git", -- string | nil
          },
          {
            source = "document_symbols",
            display_name = " Syms",
          },
        },
        winbar = true,
        show_separator_on_edge = "true",
        content_layout = "center",
        -- separator_active = { left = "|", right = "|", override = "active" },
        highlight_tab = "NeoTreeTabInactive", -- string
        highlight_tab_active = "NeoTreeTabActive", -- string
        highlight_background = "NeoTreeTabInactive", -- string
        highlight_separator = "NeoTreeTabSeparatorInactive", -- string
        highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
}
