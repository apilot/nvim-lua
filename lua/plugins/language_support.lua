-- Language support

return {

  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  {
    'vim-ruby/vim-ruby',
    config = function() vim.cmd('runtime macros/matchit.vim') end,
  },
  'tpope/vim-rails',                -- Rails support
  'vim-test/vim-test',              -- run tests from vim
  'tpope/vim-bundler',              -- use bundler from vim
  -- make vim understand ruby blocks as motions
  { 'nelstrom/vim-textobj-rubyblock', dependencies = { 'kana/vim-textobj-user', } },
  { 'rhysd/vim-textobj-ruby', dependencies = { 'kana/vim-textobj-user', } },
  'othree/html5.vim',

  -- Language diagnostics:
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to the default settings
        -- refer to the configuration section below
        mode = "document_diagnostics",
        auto_open = false,
        auto_close = true,
      }
    end
  },
}
