return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0', -- or branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter',
    'rinx/nvim-ripgrep',
    'nvim-telescope/telescope-symbols.nvim', -- emoji source for telescope
    { 'kyazdani42/nvim-web-devicons', opt = true },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    -- make telescope layout appropiate to window aspect ratio
    require("telescope").setup{
      defaults = {
        layout_strategy = "flex",
        layout_config = {
          flex = {
            flip_columns = 120,
          },
        },
      },
    }
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
