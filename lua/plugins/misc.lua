-- Отдельные плагины с конфигом менее 10 строк
return {
  {
    -- Навигация между Tmux и окнами Neovim
    -- https://github.com/christoomey/vim-tmux-navigator
    'christoomey/vim-tmux-navigator',
  },
  {
    -- Автоматическое определение tabstop и shiftwidth
    -- https://github.com/tpope/vim-sleuth
    'tpope/vim-sleuth',
  },
  {
    -- Мощная интеграция Git в Vim
    -- https://github.com/tpope/vim-fugitive
    'tpope/vim-fugitive',
  },
  {
    -- Интеграция GitHub для vim-fugitive
    -- https://github.com/tpope/vim-rhubarb
    'tpope/vim-rhubarb',
  },
  {
    -- Автозакрытие скобок, кавычек и тегов
    -- https://github.com/windwp/nvim-autopairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Подсветка TODO, NOTE и других меток в комментариях
    -- https://github.com/folke/todo-comments.nvim
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- Высокопроизводительная подсветка цветов
    -- https://github.com/norcalli/nvim-colorizer.lua
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    -- Плавная прокрутка
    -- https://github.com/karb94/neoscroll.nvim
    'karb94/neoscroll.nvim',
    opts = {},
  },
  {
    -- Отображение нажимаемых клавиш
    -- https://github.com/nvzone/showkeys
    'nvzone/showkeys',
    cmd = 'ShowkeysToggle',
    opts = {
      maxkeys = 5,
    },
  },
}
