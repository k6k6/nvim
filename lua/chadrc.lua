-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}
local utils = require "nvchad.stl.utils"
local sep_style = "round"
local sep_icons = utils.separators
local separators = sep_icons[sep_style]
local sep_l = separators["left"]
local sep_r = "%#St_sep_r#" .. separators["right"] .. " %#ST_EmptySpace#"
local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
  return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
end
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
    order = { "mode", "git", "%=", "lsp_msg", "%=", "diagnostics", "mylsp", "c" },
    modules = {
      f = function()
        return "%#NeoTreeTabActive#good"
      end,
      blank = "",
      mylsp = function()
        local icon = " "
        local t = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local path = vim.api.nvim_buf_get_name(t)
        local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"
        -- local left = ""
        -- local right = ""
        if name ~= "Empty" then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")
          if devicons_present then
            local ft, hl = devicons.get_icon_color(name)
            if hl ~= nil then
              local txt = vim.api.nvim_get_hl(0, { name = "St_file_txt" })
              local cwd = vim.api.nvim_get_hl(0, { name = "St_file_bg" })
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
              name = (vim.o.columns > 10 and client.name) or "Lsp"
            end
          end
        end
        -- return gen_block(icon, name, "%#St_file_sep#", "%#St_file_bg#", "%#St_file_txt#")
        return "%#St_file_sep#" .. sep_l .. "%#St_file_bg#" .. icon .. " " .. "%#St_file_txt#" .. " " .. name .. sep_r
      end,
      m = function()
        if not utils.is_activewin() then
          return ""
        end

        local modes = utils.modes
        local m = vim.api.nvim_get_mode().mode

        return gen_block(
          "",
          modes[m][1],
          "%#St_" .. modes[m][2] .. "ModeSep#",
          "%#St_" .. modes[m][2] .. "Mode#",
          "%#St_" .. modes[m][2] .. "ModeText#"
        )
      end,
      c = function()
        local totalL = vim.fn.line "$"
        local name = "%l/" .. totalL
        return gen_block("", name, "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
      end,
    },
  },
}

return M
