-- Debbugging

return {
  -- embedded debugger
  'mfussenegger/nvim-dap',
  'suketa/nvim-dap-ruby',
  -- install instructions https://github.com/mfussenegger/nvim-dap-python
  'mfussenegger/nvim-dap-python',

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap"
    }
  },
  'theHamsta/nvim-dap-virtual-text',
  'nvim-telescope/telescope-dap.nvim',
}
