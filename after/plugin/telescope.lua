local builtin = require('telescope.builtin')
local Job = require("plenary.job")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local vks = function(mode, key, action, desc)
  vim.keymap.set(mode, key, action , { noremap = true, desc = desc })
end

local function search_emoji()
  builtin.symbols({ sources = {'emoji'} })
end

local function grep_string()
  builtin.grep_string({ search = "", only_sort_text = true })
end

-- borrowed from ThePrimeagen/harpoon/utils.lua
local function get_os_command_output(cmd, cwd)
    if type(cmd) ~= "table" then
        print("Harpoon: [get_os_command_output]: cmd has to be a table")
        return {}
    end
    local command = table.remove(cmd, 1)
    local stderr = {}
    local stdout, ret = Job
        :new({
            command = command,
            args = cmd,
            cwd = cwd,
            on_stderr = function(_, data)
                table.insert(stderr, data)
            end,
        })
        :sync()
    return stdout, ret, stderr
end

local function project_files()
  local _, ret, _ = get_os_command_output({
    'git', 'rev-parse', '--is-inside-wirk-tree',
  })
  if ret == 0 then
    builtin.git_files({ prompt_title = 'Git Files', prompt_prefix = '>>' })
  else
    builtin.find_files()
  end
end

-- direct commands
vks('n', '<leader>b', builtin.buffers,                'Buffers')
vks('n', '<leader>r', builtin.grep_string,            'References')
vks('n', '<leader>p', project_files,                  'Paths' )
-- project_files unifies git_files and find_files
-- vks('n', '<leader>sf', builtin.git_files,              'Git files')
vks('n', '<leader>sp', builtin.find_files,             'Find files' )

-- search submenu
vks('n', '<leader>sc', builtin.commands,               'Commands')
vks('n', '<leader>s:', builtin.command_history,        'Command history')
vks('n', '<leader>sC', builtin.colorscheme,            'Colorchemes')
vks('n', '<leader>ss', grep_string,                    'String (like ag)') -- Emulate fzf's Ag:
vks('n', '<leader>sb', builtin.buffers,                'Buffers')
vks('n', '<leader>se', search_emoji,                   'Emojis')
vks('n', '<leader>sg', builtin.live_grep,              'Find/grep' )
vks('n', '<leader>sh', builtin.help_tags,              'Help')
vks('n', '<leader>sk', builtin.keymaps,                'Key mappings')
vks('n', '<leader>so', builtin.oldfiles,               'Recent Opened files')
vks('n', '<leader>sr', builtin.grep_string,            'References (grep)')
vks('n', '<leader>sd', builtin.lsp_document_symbols,   'Symbols - document')
vks('n', '<leader>sw', builtin.lsp_workspace_symbols,  'Symbols - workspace')
vks('n', '<leader>st', builtin.tags,                   'Tags')
vks('i', '<c-t>', trouble.open_with_trouble, 'trouble')
vks('n', '<c-t>', trouble.open_with_trouble, 'trouble')

-- vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' })
-- E5108: Error executing lua: ...r/start/telescope.nvim/lua/telescope/builtin/__files.lua:413: attempt to call method '_get_hl_from_capture' (a nil value) 
