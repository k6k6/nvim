vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.viewoptions = "folds,cursor"
vim.opt.sessionoptions="help,winpos,resize,folds,terminal,winsize,blank"
vim.o.clipboard = "unnamedplus"
-------------------------------------------------------------------------------- Markview highlight group --------------------------------------------------------------------------
vim.api.nvim_set_hl(0, "MarkviewHeading1", { fg = "#29c3dd", italic = true, bold = true })

------------------------------------------------------------------------- Neotree source selector highlight group ------------------------------------------------------------------
vim.api.nvim_set_hl(0, "mytab", { fg = "#141414", bg = "#777777" })
vim.api.nvim_set_hl(0, "mytabsep", { fg = "#777777" })
vim.api.nvim_set_hl(0, "NeoTreeTab", { fg = "", bg = "#192141" })
-- vim.api.nvim_set_hl(0, "NeoTreeTabInactive", {
-- fg = "#c9c6bd",
-- bg = "#f2efe4",
-- })
-- vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", {
-- fg = "#c9c6bd",
-- bg = "#f2efe4",
-- })

------------------------------------------------------- override nvim_buf_set_extmark to send error msg by vim.notify --------------------------------------------------------------------
-- local orig_set_buf = vim.api.nvim_buf_set_extmark
-- vim.api.nvim_buf_set_extmark = function(...)
--   local ok, result = pcall(orig_set_buf, ...)
--   -- if not ok then
--   -- vim.schedule(function()
--   --   vim.notify(result, vim.log.levels.ERROR, { title = "ERROR" })
--   -- end)
--   -- end
--   return result
-- end
vim.api.nvim_set_hl(0, "myLSP", {
  fg = "#bb4797",
  bg = "#fff9e8",
})

---------------------------------------------------------------------- nvim-lint auto-lint on saved -----------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    require("lint").try_lint()
  end,
})

----------------------------------------------------------- lsp signature activeparameter highlight group setting -------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    -- local orig = vim.api.nvim_get_hl(0, { name = "LspSignatureActiveParameter" })
    local repfile = vim.api.nvim_get_hl(0, { name = "St_file_txt" })
    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = repfile.fg, bold = true })
  end,
})

--------------------------------------------------------------- make the comment font italic and bold --------------------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "FileType", "BufWritePost", "VimEnter" }, {
  pattern = "*",
  callback = function()
    local orig = vim.api.nvim_get_hl(0, { name = "@comment" })
    vim.api.nvim_set_hl(0, "@comment", { fg = orig.fg, bg = orig.bg, italic = true })
  end,
})

------------------------------------------------------------- auto-update treesitter fold tree when textchanged --------------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.*",
  callback = function()
    vim.cmd "normal! zx"
    vim.cmd "silent! loadview"
  end,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*.*",
  command = "mkview",
  -- callback = function(args)
  --   local exclude_types = { "terminal", "help", "quickfix", "nofile", "nowrite", "acwrite" }
  --   local buftype = vim.fn.getbufvar(args.buf, "&buftype")
  --   if vim.tbl_contains(exclude_types, buftype) then
  --     return
  --   end
  --   vim.cmd "mkview"
  -- end,
})
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = "*.*",
  command = "silent! loadview",
})

------------------------------------------------------------------------ set shiftwidth=2 for all files -----------------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.shiftwidth = 2
  end,
})

------------------------------------------------------------------------- bootstrap lazy and all plugins ---------------------------------------------------------------
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
  -- { import = "nvchad.blink.lazyspec" },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- load custom optinos and mappings
require "options"
require "nvchad.autocmds"
vim.schedule(function()
  require "mappings"
end)

---------------------------------------------------------------- override vimtex's error sending function with vim.notify ---------------------------------------------------------------
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
