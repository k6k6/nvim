local options = {
  -- animate = { enabled = true },
  bigfile = { enabled = true, line_length = 1000 },
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
  -- image = { enabled = true },
  input = { enabled = true },
  -- lazygit = { enabled = true },
  -- scroll = { enabled = true },
  -- scope = { enabled = true },
  -- words = { enabled = true },
}
return options
