require "nvchad.mappings"
local map = vim.keymap.set

-- Some useful mappings
map({ "n", "t" }, "<A-f>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "quit insert mode" })
map("t", "jj", [[<C-\><C-n>]], { desc = "quit insert mode in terminal" })
map("n", "<leader>gi", function()
  require("snacks").lazygit()
end, { desc = "open float lazygit" })
map({ "n" }, "<leader>wp", function()
  vim.o.wrap = not vim.o.wrap
end, { desc = "switch between wrap and nowrap" })
map({ "n" }, "<leader>fn", "<cmd> Telescope notify <CR>", { desc = "open Telescope notify" })
map("n", "<leader>rl", "<cmd> e! <CR>", { desc = "reload current buffer" })

-- C++ program autorun
map({ "n" }, "<leader>rb", function()
  local _, result = pcall(vim.fn.execute, "!g++ % -g -o %:h/build/%:t:r.o")
  vim.notify(result, vim.log.levels.INFO, { title = "Cpp Build" })
end, { desc = "Build the current cpp program" })
map({ "n" }, "<leader>rg", function()
  local _, result = pcall(vim.fn.execute, "!g++ % -g -o %:h/build/%:t:r.o -lglut -lGL -lGLU")
  vim.notify(result, vim.log.levels.INFO, { title = "Opengl Build" })
end, { desc = "Build the current cpp program" })
map({ "n" }, "<leader>run", "<cmd> !%:h/build/%:t:r.o <cr>", { desc = "Run the current cpp program" })

-- Nvimtree and Neotree
local window_size = {}
local function save_window()
  for _, winid in ipairs(vim.api.nvim_list_wins()) do
    local width = vim.api.nvim_win_get_width(winid)
    local height = vim.api.nvim_win_get_height(winid)
    window_size[winid] = { width = width, height = height }
  end
end
local function restore_window()
  for winid, size in pairs(window_size) do
    if vim.api.nvim_win_is_valid(winid) then
      vim.api.nvim_win_set_width(winid, size.width)
      vim.api.nvim_win_set_height(winid, size.height)
    end
  end
end
map("n", "<leader>e", function()
  local manager = require "neo-tree.sources.manager"
  local render = require "neo-tree.ui.renderer"
  local state
  local exist = false
  for _, source in ipairs { "filesystem", "buffers", "git_status", "document_symbols" } do
    state = manager.get_state(source, nil, nil)
    if state and state.winid then
      if render.window_exists(state) then
        local bufnr = vim.api.nvim_win_get_buf(state.winid)
        if bufnr == state.bufnr then
          exist = true
          break
        end
      end
    end
  end
  if exist then
    vim.fn.execute "Neotree toggle source=last"
    restore_window()
  else
    save_window()
    vim.fn.execute "Neotree reveal"
  end
end, { desc = "NeoTree toggle" })
map("n", "<leader>a", function()
  save_window()
  vim.fn.execute "Neotree reveal"
end, { desc = "NeoTree reveal" })
-- map("n", "<leader>e", "<cmd> NvimTreeToggle <cr>", { desc = "NvimTree toggle" })
-- map("n", "<leader>a", "<cmd> NvimTreeFocus <cr>", { desc = "NvimTree Focus" })

-- Buffer
map("n", "<leader>j", "<cmd> bn <cr>", { desc = "next buffer" })
-- map("n", "<C-o>", "<cmd> bp <cr>", { desc = "previous buffer" })
map({ "n", "v", "i" }, "<C-s>", "<cmd> w <cr>", { desc = "general save file" })
map({ "n", "v" }, "<leader>q", "<cmd> q <cr>", { desc = "general close file" })
map({ "n", "v" }, "<leader>ds", function()
  require("snacks").bufdelete()
end, { desc = "buffer delete withou window" })

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
-- SnipRun mappings
map("n", "<leader>ip", "<cmd> SnipRun <CR>", { desc = "SnipRun the code" })

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
map({ "n" }, "<A-c>", "<cmd> lua require('dap').continue()<cr>", { desc = "Continue" })
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
