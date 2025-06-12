-- Отдельные плагины с конфигом менее 10 строк
return {
  {
    -- Навигация между Tmux и окнами Neovim
    'christoomey/vim-tmux-navigator',
  },
  {
    -- Автоматическое определение tabstop и shiftwidth
    'tpope/vim-sleuth',
  },
  {
    -- Мощная интеграция Git в Vim
    'tpope/vim-fugitive',
  },
  {
    -- Интеграция GitHub для vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Подсказки клавиатурных сочетаний
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {
        preset = 'modern',
        icons = {
          mappings = false,
        },
      }
    end,
  },
  {
    -- Автозакрытие скобок, кавычек и тегов
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Подсветка TODO, NOTE и других меток в комментариях
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- Высокопроизводительная подсветка цветов
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    -- Плавная прокрутка
    'karb94/neoscroll.nvim',
    opts = {},
  },
}
