return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    indent = { enabled = true },
    notifier = { enabled = true },
    scroll = { enabled = true },
    image = { enabled = true },
    terminal = {
      win = {
        style = 'terminal',
        relative = 'editor',
        position = 'bottom',
        height = 0.1,
      },
      interactive = true, -- включить все интерактивные функции
    },
    statuscolumn = {
      left = { 'mark', 'sign', 'git' },
      right = { 'fold' },
      folds = {
        open = true,
        git_hl = false,
      },
      git = {
        patterns = { 'GitSign' },
      },
      refresh = 50,
    },
  },
  keys = {
    {
      '<leader>xx',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Закрыть текущий буфер',
    },
    {
      '<leader>xa',
      function()
        Snacks.bufdelete.all()
      end,
      desc = 'Закрыть все буферы',
    },
    {
      '<leader>xo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Закрыть остальные буферы',
    },
    {
      '<leader>t/',
      function()
        Snacks.terminal()
      end,
      desc = 'Переключить терминал',
    },
  },
}
