return {
  -- LSP Zero
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'j-hui/fidget.nvim'}, -- useful updates for LSP

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-cmdline'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},

      -- signature
      { 
        'ray-x/lsp_signature.nvim',
        config =function ()
          require('lsp_signature').setup()
          vim.keymap.set('n', '<C-k>', function()
            require('lsp_signature').toggle_float_win()
          end, { silent = true, noremap = true, desc = 'toggle signature' })
        end
      }
    },
  },
  'karb94/neoscroll.nvim',
  'folke/neodev.nvim', -- init.lua support

  'onsails/lspkind.nvim', -- add nerd icons to completion menu sources
  'nvim-treesitter/nvim-treesitter',
  'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', -- LSP Diagnostics 
  {'SmiteshP/nvim-gps'},
  {
    'tree-sitter/tree-sitter-ruby'
  },
  { "windwp/nvim-ts-autotag"},
  { "RRethy/nvim-treesitter-endwise"}
}
