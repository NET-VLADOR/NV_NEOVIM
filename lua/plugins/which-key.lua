return {
  -- Подсказки клавиатурных сочетаний
  -- https://github.com/folke/which-key.nvim
  'folke/which-key.nvim',
  config = function()
    local wk = require 'which-key'
    ---@diagnostic disable-next-line: missing-fields
    wk.setup {
      preset = 'modern',
      timeoutlen = 1500,
      show_help = true,
      icons = {
        mappings = true,
        rules = {
          { pattern = '[Пп]оиск', icon = ' ', color = 'blue' },
          { pattern = '[Пп]ереключить', icon = ' ', color = 'yellow' },
          { pattern = '[Gg]it', icon = ' ', color = 'red' },
        },
      },
    }
    wk.add {
      { '<leader>;', group = 'Хлебные крошки', icon = ' ' },
      { '<leader>f', group = 'Поиск' },
      { '<leader>T', group = 'Табы', icon = ' ' },
      { '<leader>w', group = 'Окна', icon = ' ' },
      { '<leader>t', group = 'Переключить' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP', icon = '󰧑 ' },
      { '<leader>n', group = 'Создать', icon = '󰎔 ' },
    }
  end,
}
