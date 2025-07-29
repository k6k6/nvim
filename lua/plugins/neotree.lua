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
            display_name = "󰉓 Files", -- string | nil
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
        separator_active = { left = "|", right = "|", override = "active" },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
}
