-- Remote edit

return {
  {
    'chipsenkbeil/distant.nvim',
    config = function()
      local actions = require('distant.nav.actions')
      require('distant').setup {
        -- Applies Chip's personal settings to every machine you connect to
        --
        -- 1. Ensures that distant servers terminate with no connections
        -- 2. Provides navigation bindings for remote directories
        -- 3. Provides keybinding to jump into a remote file's parent directory
        -- ['*'] = require('distant.settings').chip_default()
        ['*'] = {
          file = {
            mappings = {
              ['-'] = actions.up,
            }
          },
          dir = {
            mappings ={
              ['Return'] = actions.edit,
              ['-'] = actions.up,
              ['K'] = actions.mkdir,
              ['N'] = actions.newfile,
              ['R'] = actions.rename,
              ['D'] = actions.remove,
            }
          },
        }
      }
    end
  },
}
