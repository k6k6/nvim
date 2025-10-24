local config_path = tostring(vim.fn.system "echo $XDG_CONFIG_HOME"):gsub("[\r\n]+$", "")
local options = {
  styles = {
    notification = {
      wo = {
        winblend = 5,
        wrap = true,
        conceallevel = 2,
        colorcolumn = "",
      },
    },
  },
  -- animate = { enabled = true },
  bigfile = { enabled = true, line_length = 1000 },
  dashboard = {
    enabled = true,
    width = 75,
    sections = {
      -- { section = "header" },
      {
        section = "terminal",
        cmd = "sh " .. config_path .. "/nvim/lua/utils/neo.sh",
        height = 10,
      },
      { section = "keys", gap = 1, padding = 2 },
      { section = "startup" },
    },
  },
  indent = {
    enabled = true,
    filter = function(buf)
      return vim.g.snacks_indent ~= false
        and vim.b[buf].snacks_indent ~= false
        and vim.bo[buf].buftype == ""
        and vim.bo[buf].filetype ~= "markdown"
    end,
  },
  bufdelte = { enabled = true },
  -- git = { enabled = true },
  -- image = { enabled = true },
  input = { enabled = true },
  -- lazygit = { enabled = true },
  notifier = {
    enabled = true,
    width = { min = 0.25, max = 0.25 },
    height = { min = 1, max = 0.4 },
  },
  -- notify = { enabled = true },
  scroll = { enabled = true },
  scope = { enabled = true },
  words = { enabled = true },
}
return options
