local options = {
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
    -- tabs_layout = "center",
    -- tabs_min_width = 8,
    -- separator_active = { left = "|", right = "|", override = "active" },
    separator = { left = "", right = "" },
    highlight_tab = "mytab", -- string
    highlight_tab_active = "St_cwd_bg", -- string
    highlight_background = "St_cwd_bg", -- string
    highlight_separator = "mytabsep", -- string
    highlight_separator_active = "St_cwd_sep", -- string
  },
  default_component_configs = {
    git_status = {
      symbols = {
        deleted = "",
      },
    },
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
    -- find_by_full_path_words = true, -- `false` means it only searches the tail of a path.
    -- find_command = "fd",
    -- find_args = { -- you can specify extra args to pass to the find command.
    --   fd = {
    --     "--hidden",
    --     "--exclude",
    --     ".git",
    --     "--exclude",
    --     "node_modules",
    --   },
    -- },
  },
  window = {
    width = 36,
    mappings = {
      ["h"] = "prev_source",
      ["l"] = "next_source",
      [">"] = "focus_preview",
      ["'"] = "toggle_node",
    },
  },
}
return options
