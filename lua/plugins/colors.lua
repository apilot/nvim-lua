return {
  -- Colors

  -- use({ 'rose-pine/neovim', as = 'rose-pine', })
  'sainnhe/gruvbox-material',
  -- 'nanotech/jellybeans.vim',
  {
  "nvim-zh/colorful-winsep.nvim",
  config = true,
  event = { "WinNew" },
  },

  'EdenEast/nightfox.nvim', -- duskfox is nice and good with treesiter

  -- Automatically creates missing LSP diagnostics highlight groups for color 
  -- schemes that don't yet support the Neovim 0.5 builtin lsp client.
  'folke/lsp-colors.nvim',
  'ap/vim-css-color',
}
