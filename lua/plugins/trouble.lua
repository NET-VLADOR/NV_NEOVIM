return {
  'folke/trouble.nvim',
  event = 'VeryLazy',
  cmd = 'Trouble',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('trouble').setup {
      auto_close = true,
      auto_open = false,
      auto_preview = true,
      auto_refresh = true,
      auto_jump = false,
      focus = true,
      restore = true,
      follow = true,
      indent_guides = true,
      max_items = 200,
      multiline = true,
      pinned = false,
      warn_no_results = true,
      open_no_results = false,
      ---@type trouble.Window.opts
      win = { title = 'Диагностика' },
      ---@type table<string, trouble.Action.spec|false>
      keys = {
        ['?'] = { action = 'help', desc = 'Помощь' },
        r = { action = 'refresh', desc = 'Обновить' },
        R = { action = 'toggle_refresh', desc = 'Переключить автообновление' },
        q = { action = 'close', desc = 'Закрыть' },
        o = { action = 'jump_close', desc = 'Перейти и закрыть' },
        ['<esc>'] = { action = 'cancel', desc = 'Отменить' },
        ['<cr>'] = { action = 'jump', desc = 'Перейти' },
        ['<2-leftmouse>'] = { action = 'jump', desc = 'Перейти' },
        ['<c-s>'] = { action = 'jump_split', desc = 'Перейти с разделением (горизонтально)' },
        ['<c-v>'] = { action = 'jump_vsplit', desc = 'Перейти с разделением (вертикально)' },
        ['}'] = { action = 'next', desc = 'Следующий' },
        [']]'] = { action = 'next', desc = 'Следующий' },
        ['{'] = { action = 'prev', desc = 'Предыдущий' },
        ['[['] = { action = 'prev', desc = 'Предыдущий' },
        dd = { action = 'delete', desc = 'Удалить' },
        d = { action = 'delete', mode = 'v', desc = 'Удалить' },
        i = { action = 'inspect', desc = 'Осмотреть' },
        p = { action = 'preview', desc = 'Предпросмотр' },
        P = { action = 'toggle_preview', desc = 'Переключить предпросмотр' },
        zo = { action = 'fold_open', desc = 'Раскрыть свертку' },
        zO = { action = 'fold_open_recursive', desc = 'Раскрыть свертку рекурсивно' },
        zc = { action = 'fold_close', desc = 'Свернуть' },
        zC = { action = 'fold_close_recursive', desc = 'Свернуть рекурсивно' },
        za = { action = 'fold_toggle', desc = 'Переключить свертку' },
        zA = { action = 'fold_toggle_recursive', desc = 'Переключить свертку рекурсивно' },
        zm = { action = 'fold_more', desc = 'Свернуть больше' },
        zM = { action = 'fold_close_all', desc = 'Свернуть все' },
        zr = { action = 'fold_reduce', desc = 'Уменьшить свертку' },
        zR = { action = 'fold_open_all', desc = 'Раскрыть все' },
        zx = { action = 'fold_update', desc = 'Обновить свертку' },
        zX = { action = 'fold_update_all', desc = 'Обновить все свертки' },
        zn = { action = 'fold_disable', desc = 'Отключить свертки' },
        zN = { action = 'fold_enable', desc = 'Включить свертки' },
        zi = { action = 'fold_toggle_enable', desc = 'Переключить режим сверток' },
        gb = {
          action = function(view)
            view:filter({ buf = 0 }, { toggle = true })
          end,
          desc = 'Переключить фильтр текущего буфера',
        },
        s = {
          action = function(view)
            local f = view:get_filter 'severity'
            local severity = ((f and f.filter.severity or 0) + 1) % 5
            view:filter({ severity = severity }, {
              id = 'severity',
              template = '{hl:Title}Filter:{hl} {severity}',
              del = severity == 0,
            })
          end,
          desc = 'Переключить фильтр по уровню серьезности',
        },
      },
    }
  end,
  keys = {
    {
      '<leader>da',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Общая диагностика',
    },
    {
      '<leader>db',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Местная диагностика',
    },
    {
      '<leader>ds',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Символьная диагностика',
    },
    {
      '<leader>dl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP диагностика',
    },
    {
      '<leader>dL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Список локаций диагностики',
    },
    {
      '<leader>df',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Список исправлений диагностики',
    },
    {
      '[d',
      '<cmd>Trouble diagnostics prev<cr>',
      desc = 'Предыдущая диагностика',
    },
    {
      ']d',
      '<cmd>Trouble diagnostics next<cr>',
      desc = 'Следующая диагностика',
    },
  },
}
