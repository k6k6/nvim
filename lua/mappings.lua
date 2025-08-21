require "nvchad.mappings"

local map = vim.keymap.set

-- Some useful mappings

map({ "n", "t" }, "<A-f>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "quit insert mode" })

-- C++ program autorun

-- map({ "n" }, "<leader>rub", "<cmd> !g++ % -g -o %:h/build/%:t:r.o <cr>", { desc = "Build the current cpp program" })
map({ "n" }, "<leader>run", "<cmd> !%:h/build/%:t:r.o <cr>", { desc = "Run the current cpp program" })

-- Nvimtree

map("n", "<leader>e", "<cmd> Neotree toggle source=last <cr>", { desc = "NeoTree toggle" })
map("n", "<leader>a", "<cmd> Neotree focus source=last <cr>", { desc = "NeoTree Focus" })

-- Buffer

-- map("n", "<leader>j", "<cmd> bn <cr>", { desc = "next buffer" })
map("n", "<C-o>", "<cmd> bp <cr>", { desc = "previous buffer" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "general save file" })
map({ "n", "v" }, "<leader>q", "<cmd> q <cr>", { desc = "general close file" })

-- Window operations

map({ "n", "v" }, "<A-h>", "<C-w><", { desc = "switch window to left" })
map({ "n", "v" }, "<A-j>", "<C-w>-", { desc = "switch window to down" })
map({ "n", "v" }, "<A-k>", "<C-w>+", { desc = "switch window to up" })
map({ "n", "v" }, "<A-l>", "<C-w>>", { desc = "switch window to right" })
map({ "n", "v" }, "<leader>ws", "<C-w>s", { desc = "split window" })
map({ "n", "v" }, "<leader>wv", "<C-w>v", { desc = "vertical split window" })
map({ "n", "v" }, "<leader>ww", function()
  local picker = require "window-picker"
  local picked_window = picker.pick_window()

  if picked_window then
    vim.api.nvim_set_current_win(picked_window)
  end
end, { desc = "Pick window" })

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
map(
  { "n" },
  "<leader>dc",
  "<cmd> !g++ % -g -o %:h/build/%:t:r.o <cr><cmd> lua require('dap').continue()<cr>",
  { desc = "Continue" }
)
map({ "n" }, "<A-i>", function()
  require("dap").step_into()
end, { desc = "Step Into" })
map({ "n" }, "<A-u>", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map({ "n" }, "<A-o>", function()
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
