return {
  -- Подсказки клавиатурных сочетаний
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
        },
      },
    }
    wk.add {
      { '<leader>f', group = 'Поиск' }, -- Группа клавиш связанных с поиском
    }
  end,
}
