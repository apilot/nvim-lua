-- Git 

return {

  -- Version control
  'tpope/vim-fugitive',            -- Git integration
  {
    'lewis6991/gitsigns.nvim',       -- pure lua git decorations
    config = {
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' }, 
        untracked    = { text = '┆' },
      },
      numhl = true,
      word_diff = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
    }
  },
  'mbbill/undotree',               -- visualize local undo tree
  'kdheepak/lazygit.nvim'
}
