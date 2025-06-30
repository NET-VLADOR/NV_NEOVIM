return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      row = nil,
      col = nil,
      preset = {
        keys = {
          { icon = ' ', key = 'n', desc = 'Новый файл', action = ':ene | startinsert' },
          { icon = ' ', key = 'f', desc = 'Найти файл', action = ':Telescope find_files' },
          { icon = ' ', key = 'r', desc = 'Недавние файлы', action = ':Telescope oldfiles' },
          { icon = ' ', key = 'e', desc = 'Открыть файловый менеджер', action = ':NvimTreeToggle' },
          { icon = ' ', key = 't', desc = 'Сменить тему', action = ':CatppuccinFlavour' },
          { icon = ' ', key = 'c', desc = 'Конфигурация', action = ':e $MYVIMRC' },
          { icon = ' ', key = 'u', desc = 'Обновить плагины', action = ':Lazy update' },
          { icon = ' ', key = 'q', desc = 'Выйти из Neovim', action = ':qa' },
        },
        header = [[
  ███╗   ██╗██╗   ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██║   ██║    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║██║   ██║    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║╚██╗ ██╔╝    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║ ╚████╔╝     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝  ╚═══╝  ═══ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'ГОРЯЧИЕ КЛАВИШИ', padding = 1 },
        { section = 'keys', gap = 1, indent = 2, padding = 1 },
        { icon = ' ', title = 'ПРОЕКТЫ', padding = 1 },
        { section = 'projects', gap = 1, indent = 2, padding = 1 },
        {
          pane = 2,
          icon = ' ',
          desc = 'Открыть репозиторий',
          padding = 1,
          key = 'b',
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              icon = ' ',
              title = 'Git Статус',
              cmd = 'clear && git --no-pager diff --stat -B -M -C',
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend('force', {
              pane = 2,
              section = 'terminal',
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { pane = 2, icon = ' ', title = 'НЕДАВНИЕ ФАЙЛЫ', padding = 1 },
        { pane = 2, section = 'recent_files', gap = 1, indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    indent = { enabled = true },
    notifier = { enabled = true, style = 'fancy' },
    scroll = { enabled = true },
    image = { enabled = true },
    terminal = {
      win = {
        style = 'terminal',
        relative = 'editor',
        position = 'bottom',
        height = 0.15,
      },
      interactive = true,
    },
    statuscolumn = {
      enabled = true,
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
    {
      '<leader>M',
      function()
        Snacks.dashboard.open()
      end,
      desc = 'Открыть главное меню',
    },
  },
}
