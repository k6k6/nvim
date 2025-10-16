local options = {
  -- animate = { enabled = true },
  bigfile = { enabled = true, line_length = 1000 },
  dashboard = {
    enabled = true,
    width = 75,
    sections = {
      -- { section = "header" },
      {
        section = "terminal",
        cmd = "cat ~/neovim.txt|lolcat",
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
  -- scroll = { enabled = true },
  -- scope = { enabled = true },
  -- words = { enabled = true },
}
return options
