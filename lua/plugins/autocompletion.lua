return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip').filetype_extend('typescript', { 'typescriptreact', 'javascript' })
        end,
      },
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'super-tab',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<A-CR>'] = {
          function(cmp)
            if cmp.is_visible() then
              cmp.cancel()
            else
              cmp.show()
            end
          end,
        },
        ['<C-,>'] = {
          function(cmp)
            if cmp.is_visible() then
              cmp.cancel()
            else
              cmp.show()
            end
          end,
        },
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = { border = 'none', draw = { columns = { { 'kind_icon', 'label', 'label_description', gap = 2 }, { 'kind' } } } },
        ghost_text = { enabled = true },
        documentation = { auto_show = true },
      },
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {},
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
}
