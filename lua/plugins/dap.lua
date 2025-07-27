return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config=function ()
      return require "configs.dap"
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
}
