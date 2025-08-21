-- local treesitter = require "nvim-treesitter.configs"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
local function MyFoldText()
  -- 获取折叠的行数
  local lines = vim.fn.foldclosed(vim.v.foldstart)

  -- 获取折叠起始行的内容，并去除前导和尾随空格
  local first = vim.fn.getline(vim.v.foldstart)
  local lastc = string.sub(first, -1)
  if lastc == "(" then
    text = first .. "...)"
  elseif lastc == "{" then
    text = first .. "...}"
  elseif lastc == "[" then
    text = first .. "...]"
  else
    text = first
  end
  -- 构建最终的字符串

  return text
end
vim.opt.foldtext = MyFoldText()
local options = {
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "latex" },
  },
  indent = {
    enable = true,
  },
}
return options
