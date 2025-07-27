require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "n", "i", "v" }, "<leader>q", "<cmd> wq <cr>")
map("n", "<leader>e", "<cmd> NvimTreeToggle <cr>", { desc = "NvimTree toggle in one key" })
map("n", "<leader>a", "<cmd> NvimTreeFocus <cr>", {desc = "NvimTree Focus"})

-- LSP mappings

map("n", "<A-e>", function()
  if vim.bo.filetype == "NvimTree" then
    require("nvim-tree.api").fs.rename()
  else
    require "nvchad.lsp.renamer"()
  end
end, { desc = "LSP rename" })
