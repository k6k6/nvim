local cmp_ui = require("nvconfig").ui.cmp
local cmp_style = cmp_ui.style
local format_color = require "nvchad.cmp.format"

local atom_styled = cmp_style == "atom" or cmp_style == "atom_colored"
local fields = (atom_styled or cmp_ui.icons_left) and { "kind", "abbr" } or { "abbr", "kind" }

local M = {}
function M.options(opts)
  require "snippets.init"
  opts.formatting = {
    format = function(entry, item)
      local icons = require "nvchad.icons.lspkind"
      local icon = icons[item.kind] or ""
      local kind = item.kind or ""

      if atom_styled then
        item.menu = kind
        item.menu_hl_group = "LineNr"
        item.kind = " " .. icon .. " "
      elseif cmp_ui.icons_left then
        item.menu = kind
        item.menu_hl_group = "CmpItemKind" .. kind
        item.kind = icon
      else
        item.kind = " " .. icon .. " " .. kind
        item.menu_hl_group = "comment"
      end

      if kind == "Color" and cmp_ui.format_colors.lsp then
        format_color.lsp(entry, item, (not (atom_styled or cmp_ui.icons_left) and kind) or "")
      end

      if #item.abbr > cmp_ui.abbr_maxwidth then
        item.abbr = string.sub(item.abbr, 1, cmp_ui.abbr_maxwidth) .. "…"
      end

      return item
    end,

    fields = fields,
  }
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
  -- opts.window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- }
  opts.window = {
    completion = {
      scrollbar = true,
      side_padding = atom_styled and 0 or 1,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
      border = atom_styled and "none" or "rounded",
    },

    documentation = {
      scrollbar = true,
      side_padding = 1,
      border = "rounded",
      winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
    },
  }
  return opts
end
return M
