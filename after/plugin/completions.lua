
local cmp = require('cmp')
local lspkind = require('lspkind')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  sources = {
    { name = "nvim_lua" }, -- plugin excludes itself from non-lua buffers
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = 'vsnip' },
    { name = "buffer", keyword_length = 4 }
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text', -- show symbol-then-text annotations
      maxwidth = 50,
      ellipsis_char = '...',
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[lsp]",
        nvim_lua = "[api]",
        path = "[path]",
        lua_snip = "[snp]",
        gh_issues = "[gh]",
      }
    }
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  }
})

require('neoscroll').setup()

