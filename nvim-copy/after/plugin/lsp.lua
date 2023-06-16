local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
})

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics= {
        globals = { 'vim' }
      }
    }
  }
})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  lsp.buffer_autoformat()
end)

local cmp = require('cmp')
local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')

cmp.setup({
  snippet = {
    expand = function (args)
     vim.fn['UltiSnips#anon'](args.body)
    end
  },
  sources = {
    {name= 'path'},
    {name= 'nvim_lsp'},
    {name= 'buffer', keyword_length = 3},
    {name= 'ultisnips'},
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function (fallback)
      cmp_ultisnips_mappings.compose({"select_next_item", "jump_forwards"})(fallback)
    end,{"i", "s"}),
    ['<S-Tab>'] = cmp.mapping(function (fallback)
      cmp_ultisnips_mappings.compose({"select_prev_item", "jump_backwards"})(fallback)
    end,{"i", "s"}),
    ['<C-j>'] = cmp.mapping(function (fallback)
      cmp_ultisnips_mappings.compose({"expand"})(fallback)
    end,{"i", "s"})
  }
})

lsp.setup()
