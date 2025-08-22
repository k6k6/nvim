vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.guicursor =
  "n-v-c-sm:block,i-ci-ve:ver25-Cursor-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
-- vim.api.nvim_set_hl(0, "NeoTreeTabInactive", {
-- fg = "#c9c6bd",
-- bg = "#f2efe4",
-- })
-- vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", {
-- fg = "#c9c6bd",
-- bg = "#f2efe4",
-- })
local orig_set_buf = vim.api.nvim_buf_set_extmark
vim.api.nvim_buf_set_extmark = function(buffer, ns_id, line, col, opts)
  local ok, result = pcall(orig_set_buf, buffer, ns_id, line, col, opts)
  if not ok then
    vim.schedule(function()
      vim.notify(result, vim.log.levels.ERROR, { title = "Error" })
    end)
    return nil
  end
  return result
end
vim.api.nvim_set_hl(0, "myLSP", {
  fg = "#bb4797",
  bg = "#fff9e8",
})
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    -- local orig = vim.api.nvim_get_hl(0, { name = "LspSignatureActiveParameter" })
    local repfile = vim.api.nvim_get_hl(0, { name = "St_file_txt" })
    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = repfile.fg, bold = true })
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local orig = vim.api.nvim_get_hl(0, { name = "@comment" })
    vim.api.nvim_set_hl(0, "@comment", { fg = orig.fg, bg = orig.bg, italic = true })
  end,
})
vim.api.nvim_create_autocmd("TextChanged", {
  callback = function()
    vim.cmd "normal! zx"
  end,
})
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
vim.schedule(function()
  require "mappings"
end)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    vim.cmd [[
  function! vimtex#log#info(msg, ...) abort
    call luaeval("vim.notify(_A.msg, vim.log.levels.INFO, { title = 'VimTeX Info' })", {'msg': a:msg})
  endfunction

  function! vimtex#log#warning(msg, ...) abort
    call luaeval("vim.notify(_A.msg, vim.log.levels.WARN, { title = 'VimTeX Warning' })", {'msg': a:msg})
  endfunction

  function! vimtex#log#error(msg, ...) abort
    call luaeval("vim.notify(_A.msg, vim.log.levels.ERROR, { title = 'VimTeX Error' })", {'msg': a:msg})
  endfunction
    ]]
  end,
})
