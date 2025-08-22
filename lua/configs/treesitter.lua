-- local treesitter = require "nvim-treesitter.configs"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99

-- function _G.MyFoldText()
--   -- 获取折叠的行数
--   local lines = vim.v.foldend - vim.v.foldstart + 1
--
--   -- 获取折叠起始行的内容，并去除前导和尾随空格
--   local first = vim.fn.getline(vim.v.foldstart)
--
--   -- 构建最终的字符串
--   local text = string.format("%s | %d", first, lines)
--
--   return text
-- end

vim.opt.foldtext = ""

local options = {
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
return options
