-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest_light",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
M.nvdash = {
  load_on_startup = true,
  header = {
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
  },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
    order = { "mode", "git", "%=", "lsp_msg", "%=", "diagnostics", "mylsp", "cursor" },
    modules = {
      f = function()
        return "%#NeoTreeTabActive#good"
      end,
      blank = " ",
      mylsp = function()
        local icon = " "
        local t = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local path = vim.api.nvim_buf_get_name(t)
        local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"
        local left = ""
        local right = ""
        if name ~= "Empty" then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")
          if devicons_present then
            local ft, hl = devicons.get_icon_color(name)
            if hl ~= nil then
              local txt = vim.api.nvim_get_hl(0, { name = "St_cwd_txt" })
              local cwd = vim.api.nvim_get_hl(0, { name = "St_cwd_bg" })
              vim.api.nvim_set_hl(0, "LSP", { fg = hl, bg = cwd.bg })
              vim.api.nvim_set_hl(0, "sep2", { fg = txt.bg, bg = "" })
              vim.api.nvim_set_hl(0, "sep1", { fg = cwd.bg, bg = txt.bg })
            end
            icon = (ft ~= nil and ft) or icon
          end
        end
        if rawget(vim, "lsp") then
          for _, client in ipairs(vim.lsp.get_clients()) do
            if client.attached_buffers[t] then
              name = (vim.o.columns > 100 and client.name) or "LSP"
            end
          end
        end
        return "%#St_cwd_sep#"
          .. left
          .. "%#St_cwd_bg#"
          .. icon
          .. " "
          .. "%#St_cwd_txt#"
          .. " "
          .. name
          .. "%#St_sep_r#"
          .. right
          .. " %#ST_EmptySpace#"
      end,
    },
  },
}

return M
