-- Visual aids

return {
  'Yggdroot/indentLine',           -- indent block guides
  'mrjones2014/nvim-ts-rainbow',   -- treesitter to color delimiter pairs
  'RRethy/vim-illuminate',         -- highligh other uses of word under cursor
  'kshenoy/vim-signature',         -- show 'marks in the gutter
  'akinsho/bufferline.nvim',

  {
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup() end
  },

  -- Command line info
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
  },
  'arkav/lualine-lsp-progress',

  -- Show hints for composed keymaps
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to the default settings
        -- refer to the configuration section below
      }
    end
  },
}
