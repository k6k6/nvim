local lspconfig = require "lspconfig"
-- local mr = require "mason-registry" -- 这行目前没什么用，之后会用上
local masonlsp = require "mason-lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

local settings = {
  Lua = {
    workspace = {
      maxPreload = 1000000,
      preloadFileSize = 10000,
    },
  },
}
-- If current working directory is Neovim config directory
local in_neovim_config_dir = (function()
  local stdpath_config = vim.fn.stdpath "config"
  local config_dirs = type(stdpath_config) == "string" and { stdpath_config } or stdpath_config
  ---@diagnostic disable-next-line: param-type-mismatch
  for _, dir in ipairs(config_dirs) do
    if vim.fn.getcwd():find(dir, 1, true) then
      return true
    end
  end
end)()

if in_neovim_config_dir then
  -- Add vim to globals for type hinting
  settings.Lua.diagnostic = settings.Lua.diagnostic or {}
  settings.Lua.diagnostic.globals = settings.Lua.diagnostic.globals or {}
  table.insert(settings.Lua.diagnostic.globals, "vim")

  -- Add all plugins installed with lazy.nvim to `workspace.library` for type hinting
  settings.Lua.workspace.library = vim.list_extend({
    vim.fn.expand "$VIMRUNTIME/lua",
    vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
    "${3rd}/busted/library", -- Unit testing
    "${3rd}/luassert/library", -- Unit testing
    "${3rd}/luv/library", -- libuv bindings (`vim.uv`)
  }, vim.fn.glob(vim.fn.stdpath "data" .. "/lazy/*", true, true))
end

---@diagnostic disable-next-line: undefined-field
vim.lsp.config("lua_ls", {
  settings = settings,
})

lspconfig.clangd.setup {
  cmd = { "clangd" },
}
vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        autoFormatStrings = true,
        typeCheckingMode = "off",
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          callArgumentNamesMatching = true,
        },
      },
    },
  },
})
vim.lsp.config("texlab", {
  settings = {
    texlab = {
      chktex = {
        onOpenAndSave = true,
      },
    },
  },
})
vim.lsp.config("ruff", {
  init_options = {
    settings = {
      lint = {
        enable = false,
      },
    },
  },
})
vim.lsp.config("dprint", {
  enable = false,
})
-- vim.lsp.config("markdown_oxide", {
--   capabilities = vim.tbl_deep_extend("force", nvlsp.capabilities, {
--     workspace = {
--       didChangeWatchedFiles = {
--         dynamicRegistration = true,
--       },
--     },
--   }),
--   settings = {
--     completion = {
--       enable = true,
--     },
--   },
-- })
masonlsp.setup {
  handlers = {
    function(server)
      local lsp = require("lspconfig")[server]
      lsp.setup {
        on_attach = function(client, bufnr)
          nvlsp.on_attach(client, bufnr)
          -- if client:supports_method("textDocument/inlayHint", { bufnr = bufnr }) then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          -- end
        end,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
      }
    end,
  },
}
-- 给所有 LSP 悬浮窗口（hover, signatureHelp, diagnostics）统一加圆角
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
