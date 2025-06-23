return {
  'folke/which-key.nvim',
  config = function()
    local wk = require 'which-key'
    wk.setup {
      timeoutlen = 1500,
      show_help = true,
      icons = {
        mappings = true,
        rules = {
          { pattern = '[Пп]оиск', icon = ' ', color = 'blue' },
          { pattern = 'диагностик', icon = ' ', color = 'red' },
          { pattern = '[Пп]ереключить', icon = ' ', color = 'yellow' },
          { pattern = '[Gg]it', icon = ' ', color = 'red' },
        },
      },
    }
    wk.add {
      { '<leader>;', group = 'Хлебные крошки', icon = ' ' },
      { '<leader>f', group = 'Поиск' },
      { '<leader>x', group = 'Закрыть', icon = ' ' },
      { '<leader>T', group = 'Табы', icon = ' ' },
      { '<leader>w', group = 'Окна', icon = ' ' },
      { '<leader>t', group = 'Переключить' },
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP', icon = '󰧑 ' },
      { '<leader>n', group = 'Создать', icon = '󰎔 ' },
    }
  end,
}
