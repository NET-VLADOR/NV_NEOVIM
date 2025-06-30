return {
  'folke/which-key.nvim',
  opts = {
    preset = 'modern',
    timeoutlen = 1500,
    show_help = true,
    win = { title = 'Горячие клавиши' },
    icons = {
      mappings = true,
      rules = {
        { pattern = '[Пп]оиск', icon = ' ', color = 'blue' },
        { pattern = '[Дд]иагностик', icon = ' ', color = 'red' },
        { pattern = '[Пп]ереключить', icon = ' ', color = 'yellow' },
        { pattern = '[Gg]it', icon = ' ', color = 'red' },
      },
    },
    spec = {
      { '<leader>;', group = 'Хлебные крошки', icon = ' ' },
      { '<leader>f', group = 'Поиск' },
      { '<leader>x', group = 'Закрыть', icon = ' ' },
      { '<leader>T', group = 'Табы', icon = ' ' },
      { '<leader>w', group = 'Окна', icon = ' ' },
      { '<leader>t', group = 'Переключить' },
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP', icon = '󰧑 ' },
      { '<leader>n', group = 'Создать', icon = '󰎔 ' },
      { '<leader>d', group = 'Диагностика' },
    },
  },
}
