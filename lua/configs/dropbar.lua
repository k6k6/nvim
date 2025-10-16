local options = {
  bar = {
    sources = function(buf, _)
      local utils = require "dropbar.utils"
      local sources = require "dropbar.sources"
      local lspft = { "lua", "python", "java" }
      if vim.bo[buf].ft == "markdown" then
        return {
          -- sources.path,
          sources.markdown,
        }
      end
      if vim.tbl_contains(lspft, vim.bo[buf].ft) then
        return {
          sources.lsp,
        }
      end
      -- if vim.bo[buf].buftype == "terminal" then
      --   return {
      --     sources.terminal,
      --   }
      -- end
      return {
        -- sources.path,
        utils.source.fallback {
          sources.treesitter,
          sources.lsp,
        },
      }
    end,
  },
}
return options
