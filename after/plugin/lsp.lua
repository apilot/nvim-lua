vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')

lsp.preset({
  name = 'recommended',
  set_lsp_keymaps = false, -- using custom
  configure_diagnostics = {
    underline = false,
    virtual_text = false,
    -- virtual_text = {
    --   source = "always", -- Or "if_many"
    --   -- prefix = '●', -- Could be '■', '▎', 'x'
    --   spacing = 5
    -- },
    signs = true,
    severity_sort = true,
    update_in_insert = false,
    float = {
      source = "always", -- Or "always"
    },
  }
})

lsp.ensure_installed({
  'html',
  'cssls',
  'tsserver',
  'solargraph',
  'eslint',
  'luau_lsp',
  'pyright',
  'pylsp',
  'ruff_lsp',
})

-- keymaps to add only on buffers with LSP support (overriding grep/tags based defaults)
local function custom_on_attach(_, bufnr)
  print("lsp.on_attach")
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local keymap = function(mode, key, action, desc)
    vim.keymap.set(mode, key, action, { buffer = bufnr, remap = false, desc = desc })
  end
  local diagnostic = vim.diagnostic -- fmt('<cmd>lua vim.diagnostic.%s<cr>')
  -- local float_opts = { float = { border = 'single' } }
  keymap("n", "gd", vim.lsp.buf.definition, 'go to definition (LSP)')
  keymap("n", "gD", vim.lsp.buf.declaration, 'go to declaration (LSP)')
  keymap("n", "gr", vim.lsp.buf.references, 'go to [r]eferences (LSP)')
  keymap("n", "]e", diagnostic.goto_next, 'next error (LSP)')
  keymap("n", "[e", diagnostic.goto_prev, 'previous error (LSP)')
  keymap("n", "gi", vim.lsp.buf.implementation, 'goto implementation (LSP)')
  keymap("n", "K", vim.lsp.buf.hover, 'show info (LSP)')
  keymap("n", "R", vim.lsp.buf.rename, 'rename symbol (LSP)')          -- default is <F2>
  keymap("v", "g=", vim.lsp.buf.format, 'reformat (LSP)')
  keymap("n", "gl", vim.lsp.diagnostic.get_line_diagnostics, 'line diagnostic (LSP)')
end

lsp.on_attach(custom_on_attach)

require('neodev').setup()

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup() -- before lspconfig overrides


-- Set up lspconfig.
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['solargraph'].setup { capabilities = lsp_capabilities }
require('lspconfig')['html'].setup { capabilities = lsp_capabilities }
require('lspconfig')['cssls'].setup { capabilities = lsp_capabilities }
require('lspconfig')['tsserver'].setup { capabilities = lsp_capabilities }
require('lspconfig')['eslint'].setup { capabilities = lsp_capabilities }
require('lspconfig')['luau_lsp'].setup {
  capabilities = lsp_capabilities,
  settings = { Lua = { diagnostics = { globals = { 'vim', 'require' } } } }
}
-- require('lspconfig')['pyright'].setup{
--   capabilities = lsp_capabilities,
--   settings = {
--     python = {
--       analysis = {
--         typeCheckingMode = "basic"
--       }
--     }
--   },
-- }
require('lspconfig')['pylsp'].setup {
  capabilities = lsp_capabilities,
  on_attach = custom_on_attach, -- pylsp requires this explicit
  settings = {
    pylsp = {
      plugins = {
        flake8 = { enabled = true, maxLineLength = 120 },
        rope_completion = { enabled = true },
        pycodestyle = { enabled = true, maxLineLength = 120 },
        mypy = { enabled = true, maxLineLength = 120 },
        yapf = { enabled = true },
        autopep8 = { enabled = false },        -- yapf preferred
        mccabe = { enabled = false },
        pylint = { enabled = false },
      },
    },
  },
}
require('lspconfig')['ruff_lsp'].setup { capabilities = lsp_capabilities }

-- install lua-language-server from binary release:
-- mkdir -p ~/src/lua-language-server
-- cd ~/src/lua-language-server
-- wget https://github.com/sumneko/lua-language-server/releases/download/3.6.7/lua-language-server-3.6.7-linux-x64.tar.gz
-- tar -xzf lua-language-server-3.6.7-linux-x64.tar.gz
-- on $PATH
-- #!/bin/bash
-- exec "<path-to-directory>/bin/lua-language-server" "$@"

-- Trouble
local set_key = function(mode, key, action, desc)
  vim.keymap.set(mode, key, action, { silent = true, noremap = true, desc = desc })
end

set_key("n", "<leader>xx", "<cmd>TroubleToggle<cr>", "Toggle Trouble")
set_key("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace_diagnostics")
set_key("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", "document_diagnostics")
set_key("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", "loclist")
set_key("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", "quickfix")
set_key("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", "lsp_references")
set_key("n", "<leader>xf", "<cmd>lua vim.lsp.buf.format()<cr>", 'reformat buffer (LSP)')

local trouble = require("trouble")

set_key("n", "<leader>xn", function() trouble.next({ skip_groups = true, jump = true }) end, "Next trouble")

require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  --
}

