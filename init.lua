vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.guicursor =
  "n-v-c-sm:block,i-ci-ve:ver25-Cursor-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
vim.api.nvim_set_hl(0, "NeoTreeTabInactive", {
  fg = "#c9c6bd",
  bg = "#f2efe4",
})
vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", {
  fg = "#c9c6bd",
  bg = "#f2efe4",
})
vim.api.nvim_set_hl(0, "myLSP", {
  fg = "#bb4797",
  bg = "#fff9e8",
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
