return {
  -- Плагин для навигации по коду через "хлебные крошки"
  -- https://github.com/Bekaboo/dropbar.nvim
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  config = function()
    local dropbar_api = require 'dropbar.api'

    -- Настройка клавиатурных сочетаний
    vim.keymap.set('n', '<Leader>;', dropbar_api.pick, {
      desc = 'Поиск символов в строке навигации',
    })
    vim.keymap.set('n', '[;', dropbar_api.goto_context_start, {
      desc = 'Переход к началу текущего контекста',
    })
    vim.keymap.set('n', '];', dropbar_api.select_next_context, {
      desc = 'Выбор следующего контекста',
    })
  end,
}
