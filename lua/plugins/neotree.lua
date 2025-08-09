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
      popup_border_style = "rounded",
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
            display_name = " File", -- string | nil
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
        show_separator_on_edge = true,
        content_layout = "center",
        -- separator_active = { left = "|", right = "|", override = "active" },
        highlight_tab = "NeoTreeTabActive", -- string
        highlight_tab_active = "St_file_txt", -- string
        highlight_background = "NeoTreeTabActive", -- string
        highlight_separator = "NeoTreeTabSeparatorActive", -- string
        highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
      },
      default_component_configs = {
        icon = {
          default = "",
          highlight = false,
          provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local dicon, dhl = web_devicons.get_icon "default_icon"
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or dicon
                icon.highlight = hl or dhl
              end
            end
          end,
        },
      },
      filesystem = {
        filtered_items = {
          -- visible = true,
          -- hide_dotfiles = false,
        },
      },
      window = {
        mappings = {
          ["h"] = "prev_source",
          ["l"] = "next_source",
          [">"] = "focus_preview",
          ["'"] = "toggle_node",
        },
      },
    },
  },
}
