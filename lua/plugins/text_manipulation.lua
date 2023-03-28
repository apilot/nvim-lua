-- String manipulation

return { 
  'AndrewRadev/splitjoin.vim',     -- Split/Join ruby hashes, arglists, etc
  'AndrewRadev/switch.vim',        -- Automate common substitutions
  'AndrewRadev/tagalong.vim',      -- Change closing html-ish tags automatically
  'tpope/vim-commentary',          -- Commenting shortcuts gc
  -- 'tpope/vim-surround',            -- change surrounding text object cs<char><new>
  {
    'echasnovski/mini.surround',
    config = function () require('mini.surround').setup() end
  },
}
