
-- Ruby
function RTags()
  vim.cmd [[!ctags -f .tags --languages=ruby --exclude=.git -R .]]
end
vim.keymap.set("n", "<leader>Tr", RTags, { desc = "rebuild [r]uby [T]ags (CTags)"})

-- Rails
vim.g.rails_ctags_arguments = '-f .tags --languages=ruby --exclude=.git --exclude=log --exclude=tmp --exclude=.bundle -R . &'
vim.keymap.set('n', '<leader>TR', vim.cmd.Ctags, { desc = 'rebuild [R]ails [T]ags (CTags)' })

-- Python
local function pyTags()
  vim.cmd([[!ctags -f .tags --languages=python --exclude=.git --exclude=.pyc -R .]])
end
vim.keymap.set("n", "<leader>Tpy", pyTags, { desc = "rebuilt [Py]hton [T]ags"})

