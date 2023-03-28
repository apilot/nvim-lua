
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  -- sections = {
  --   lualine_a = {
  --     { 'filename', path = 1 }
  --   }
  -- }
}

vim.opt.termguicolors = true
require("bufferline").setup{}
