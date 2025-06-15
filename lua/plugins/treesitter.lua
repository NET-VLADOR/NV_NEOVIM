return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Команда обновления парсеров
  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      -- Список языков для установки
      ensure_installed = {
        'lua',
        'javascript',
        'typescript',
        'vimdoc',
        'vim',
        'regex',
        'sql',
        'dockerfile',
        'toml',
        'json',
        'java',
        'c_sharp',
        'gitignore',
        'yaml',
        'markdown',
        'markdown_inline',
        'bash',
        'tsx',
        'css',
        'html',
      },

      -- Автоустановка отсутствующих парсеров
      auto_install = true,
      sync_install = false,

      -- Настройки подсветки
      highlight = {
        enable = true, -- Включить подсветку синтаксиса
      },

      -- Настройки автоотступов
      indent = {
        enable = true, -- Включить автоотступы
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Enter>',
          node_incremental = '<Enter>',
          scope_incremental = false,
          node_decremental = '<Backspace>',
        },
      },
    }
    -- Примечание: Дополнительные модули Treesitter:
    --   - Инкрементальное выделение (встроено)
    --   - Показ контекста: https://github.com/nvim-treesitter/nvim-treesitter-context
    --   - Текстобъекты: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
