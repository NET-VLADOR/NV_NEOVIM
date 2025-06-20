return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    -- https://github.com/Saghen/blink.cmp
    'saghen/blink.cmp',
    -- опционально: предоставляет сниппеты для источника сниппетов
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
      -- 'default' (рекомендуется): мэппинги как в стандартном автодополнении (C-y для принятия)
      -- 'super-tab': мэппинги как в VSCode (Tab для принятия)
      -- 'enter': Enter для принятия
      keymap = {
        preset = 'super-tab',
        ['<C-j>'] = { 'select_next', 'fallback' }, -- Следующий элемент
        ['<C-k>'] = { 'select_prev', 'fallback' }, -- Предыдущий элемент
        ['<A-CR>'] = {
          function(cmp)
            if cmp.is_visible() then
              cmp.cancel()
            else
              cmp.show()
            end
          end, -- Принудительный вызов автодополнения
        },
      },
      appearance = {
        -- 'mono' (по умолчанию): для 'Nerd Font Mono'
        -- 'normal': для 'Nerd Font'
        -- Регулировка отступов для выравнивания иконок
        nerd_font_variant = 'mono',
      },
      -- (По умолчанию) Документация только при ручном вызове
      completion = {
        menu = { border = 'rounded', draw = { columns = { { 'kind_icon', 'label', 'label_description', gap = 2 }, { 'kind' } } } },
        ghost_text = { enabled = true },
        documentation = { auto_show = true },
      },
      snippets = { preset = 'luasnip' },
      -- Стандартный список источников для расширения
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {},
      },

      -- (По умолчанию) Rust fuzzy-поиск для устойчивости к опечаткам и производительности
      -- Альтернативы:
      -- `implementation = "lua"` для Lua-реализации
      -- `implementation = "prefer_rust"` для Rust с Lua-фолбэком
      --
      -- Детали см. в документации fuzzy
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
}
