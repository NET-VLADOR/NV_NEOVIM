return {
  -- Подсказки клавиатурных сочетаний
  -- https://github.com/folke/which-key.nvim
  'folke/which-key.nvim',
  config = function()
    local wk = require 'which-key'
    wk.setup {
      preset = 'modern',
      timeoutlen = 1500,
      show_help = false,
      icons = {
        mappings = true,
        rules = {
          { pattern = '[Пп]оиск', icon = ' ', color = 'green' },
          { pattern = '[Пп]ереключить', icon = ' ', color = 'yellow' },
          { pattern = '[Gg]it', icon = ' ', color = 'red' },
        },
      },
    }
    wk.add {
      { '<leader>f', group = 'Поиск' }, -- Группа клавиш связанных с поиском
      { '<leader>T', group = 'Табы', icon = ' ' }, -- Группа клавиш связанных с работой с табами
      { '<leader>w', group = 'Окна', icon = ' ' }, -- Группа клавиш связанных с работой с табами
      { '<leader>t', group = 'Переключить' }, -- Группа клавиш связанных с переключением значений
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Группа клавиш связанных с Git Hunk
      { '<leader>l', group = 'LSP' }, -- Группа клавиш связанных с LSP
    }
  end,
}
