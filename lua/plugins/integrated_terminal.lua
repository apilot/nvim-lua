-- Integrated terminal
return {
  {
    'akinsho/toggleterm.nvim',
    config = function ()
      require("toggleterm").setup {
        open_mapping = '<c-t>',
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      }
    end },
}
