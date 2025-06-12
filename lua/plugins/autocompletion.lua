return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    -- Иконки для типов автодополнения
    local kind_icons = {
      Text = '󰉿',
      Method = 'm',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '󰆧',
      Class = '󰌗',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰇽',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰊄',
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- Настройки горячих клавиш:
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(), -- Следующий элемент
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Предыдущий элемент
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Прокрутка доков вверх
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Прокрутка доков вниз
        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Подтвердить выбор
        ['<C-Space>'] = cmp.mapping.complete {}, -- Принудительный вызов автодополнения

        -- Навигация внутри сниппетов:
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump() -- Переход вперед в сниппете
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1) -- Переход назад в сниппете
          end
        end, { 'i', 's' }),

        -- Умный Tab/Shift-Tab:
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- Выбор следующего элемента
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump() -- Активация/переход в сниппете
          else
            fallback() -- Стандартное поведение Tab
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Выбор предыдущего элемента
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1) -- Переход назад в сниппете
          else
            fallback() -- Стандартное поведение Shift-Tab
          end
        end, { 'i', 's' }),
      },

      -- Источники автодополнения
      sources = {
        { name = 'lazydev', group_index = 0 },
        { name = 'nvim_lsp' }, -- LSP серверы
        { name = 'luasnip' }, -- Сниппеты
        { name = 'buffer' }, -- Буфер текущего файла
        { name = 'path' }, -- Пути файловой системы
      },

      -- Форматирование внешнего вида
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          vim_item.kind = kind_icons[vim_item.kind] -- Иконка типа
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            luasnip = '[Сниппет]',
            buffer = '[Буфер]',
            path = '[Путь]',
          })[entry.source.name] -- Источник дополнения
          return vim_item
        end,
      },
    }
  end,
}
