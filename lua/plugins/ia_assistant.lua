-- IA Assistant

return {
    {
      'Exafunction/codeium.vim',
      config = function ()
        vim.keymap.set('i', '<s-tab>', function () return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
        vim.keymap.set('i', '<c-:>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
        vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        vim.keymap.set('i', '<c-Bslash>', function() return vim.fn['codeium#Complete']() end, { expr = true })
        vim.keymap.set('n', '<leader><s-tab>', ':CodeiumEnable', { expr = true })
        vim.keymap.set('n', '<leader><tab>', ':CodeiumDisable', { expr = true })
        vim.fn.CodeiumDisable()  -- disable codeium until manually enabled
      end
    }
}
