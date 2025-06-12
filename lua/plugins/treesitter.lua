return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Команда обновления парсеров
  main = 'nvim-treesitter.configs', -- Основной модуль конфигурации
  opts = {
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

    -- Настройки подсветки
    highlight = {
      enable = true, -- Включить подсветку синтаксиса
      -- Языки, требующие regex-подсветки Vim
      additional_vim_regex_highlighting = { 'javascript' },
    },

    -- Настройки автоотступов
    indent = {
      enable = true, -- Включить автоотступы
    },
  },

  -- Примечание: Дополнительные модули Treesitter:
  --   - Инкрементальное выделение (встроено)
  --   - Показ контекста: https://github.com/nvim-treesitter/nvim-treesitter-context
  --   - Текстобъекты: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
