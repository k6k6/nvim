return {
  "folke/trouble.nvim",
  opts = {
    pinned = true,
    preview = {
      type = "float",
      relative = "editor",
      border = "rounded",
      title = "Preview",
      title_pos = "center",
      position = { 0, -2 },
      size = { width = 0.5, height = 0.35 },
      zindex = 200,
    },
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>sd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>sl",
      "<cmd>Trouble lsp toggle focus=false <cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
  },
}
