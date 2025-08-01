require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "quit insert mode" })
map({ "n" }, "<leader>rub", "<cmd> !g++ % -g -o %:h/build/%:r.o <cr>", { desc = "Build the current cpp program" })
map({ "n" }, "<leader>run", "<cmd> !./%:h/build/%:r.o <cr>", { desc = "Run the current cpp program" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "general save file" })
map({ "n", "v" }, "<leader>q", "<cmd> q <cr>", { desc = "general close file" })
-- Nvimtree
map("n", "<leader>e", "<cmd> Neotree toggle source=last <cr>", { desc = "NeoTree toggle" })
map("n", "<leader>a", "<cmd> Neotree focus source=last <cr>", { desc = "NeoTree Focus" })
-- Buffer
map("n", "<leader>j", "<cmd> bn <cr>", { desc = "next buffer" })
map("n", "<leader>k", "<cmd> bp <cr>", { desc = "previous buffer" })

-- LSP mappings

map("n", "<A-e>", function()
  if vim.bo.filetype == "NvimTree" then
    require("nvim-tree.api").fs.rename()
  else
    require "nvchad.lsp.renamer"()
  end
end, { desc = "LSP rename" })

-- DAP mappings
map({ "n" }, "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map({ "n" }, "<leader>dc", function()
  require("dap").continue()
end, { desc = "Continue" })
map({ "n" }, "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })
map({ "n" }, "<leader>du", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map({ "n" }, "<leader>do", function()
  require("dap").step_out()
end, { desc = "Step Out" })
map({ "n" }, "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "Open REPL" })
map({ "n" }, "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Run Last" })
map({ "n" }, "<leader>dq", function()
  require("dap").terminate()
  require("dapui").close()
  require("nvim-dap-virtual-text").toggle()
end, { desc = "Terminate" })
map({ "n" }, "<leader>dt", function()
  require("dap").list_breakpoints()
end, { desc = "List Breakpoints" })
map({ "n" }, "<leader>de", function()
  require("dap").set_exception_breakpoints { "all" }
end, { desc = "Set Exception Breakpoints" })
