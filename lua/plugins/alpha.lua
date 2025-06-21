return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'catppuccin/nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local theme = require 'core.theme-manager'

    local function setup_alpha(palette)
      vim.cmd('highlight AlphaHeader guifg=' .. palette.mauve)
      vim.cmd('highlight AlphaQuote guifg=' .. palette.subtext0)
      vim.cmd('highlight AlphaButton guifg=' .. palette.text)
      vim.cmd('highlight AlphaFooter guifg=' .. palette.blue)

      dashboard.section.header.val = {
        [[                                                                            ]],
        [[  ███╗   ██╗██╗   ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[  ████╗  ██║██║   ██║    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[  ██╔██╗ ██║██║   ██║    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[  ██║╚██╗██║╚██╗ ██╔╝    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[  ██║ ╚████║ ╚████╔╝     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[  ╚═╝  ╚═══╝  ╚═══╝  ═══ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        [[                                                                            ]],
      }

      dashboard.section.header.opts.hl = 'AlphaHeader'
      dashboard.section.header.opts.position = 'center'

      local quotes = {
        'Any fool can write code that a computer can understand. Good programmers write code that humans can understand. - Martin Fowler',
        'The only way to learn a new programming language is by writing programs in it. - Dennis Ritchie',
        'First, solve the problem. Then, write the code. - John Johnson',
        "Code is like humor. When you have to explain it, it's bad. - Cory House",
        "Programming isn't about what you know; it's about what you can figure out. - Chris Pine",
        'The best error message is the one that never shows up. - Thomas Fuchs',
        'Make it work, make it right, make it fast. - Kent Beck',
        'Truth can only be found in one place: the code. - Robert C. Martin',
        'The function of good software is to make the complex appear simple. - Grady Booch',
        'Simplicity is the soul of efficiency. - Austin Freeman',
      }

      local random_quote = quotes[math.random(#quotes)]

      dashboard.section.quote = {
        type = 'text',
        val = random_quote,
        opts = {
          position = 'center',
          hl = 'AlphaQuote',
        },
      }

      dashboard.section.buttons.val = {
        dashboard.button('n', '  Новый файл', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  Найти файл', ':Telescope find_files<CR>'),
        dashboard.button('r', '  Недавние файлы', ':Telescope oldfiles<CR>'),
        dashboard.button('e', '  Открыть файловый менеджер', ':NvimTreeToggle<CR>'),
        dashboard.button('t', '  Сменить тему', ':CatppuccinFlavour<CR>'),
        dashboard.button('c', '  Конфигурация', ':e $MYVIMRC<CR>'),
        dashboard.button('u', '  Обновить плагины', ':Lazy update<CR>'),
        dashboard.button('q', '  Выйти из Neovim', ':qa<CR>'),
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = 'AlphaButton'
        button.opts.position = 'center'
        button.opts.width = 50
        button.opts.hl_shortcut = 'AlphaButton'
      end

      local datetime = os.date '%d.%m.%Y %H:%M:%S'

      dashboard.section.footer.val = {
        '🚀 ' .. datetime,
        '🎨 Catppuccin ' .. theme.current.flavour:gsub('^%l', string.upper),
      }

      dashboard.section.footer.opts = {
        position = 'center',
        hl = 'AlphaFooter',
      }

      dashboard.config.layout = {
        {
          type = 'padding',
          val = function()
            local total_height = #dashboard.section.header.val + 1 + #dashboard.section.buttons.val + #dashboard.section.footer.val + 5
            return math.floor((vim.o.lines - total_height) / 2)
          end,
        },
        dashboard.section.header,
        { type = 'padding', val = 1 },
        dashboard.section.quote,
        { type = 'padding', val = 2 },
        dashboard.section.buttons,
        { type = 'padding', val = 1 },
        dashboard.section.footer,
        {
          type = 'padding',
          val = function()
            local total_height = #dashboard.section.header.val + 1 + #dashboard.section.buttons.val + #dashboard.section.footer.val + 5
            return math.ceil((vim.o.lines - total_height) / 2)
          end,
        },
      }

      alpha.setup(dashboard.config)

      vim.api.nvim_set_hl(0, 'AlphaBackground', { bg = palette.base })
      vim.cmd 'autocmd FileType alpha setlocal winhighlight=Normal:AlphaBackground'
    end

    setup_alpha(theme.current.palette)
    theme.subscribe(setup_alpha)
  end,
}
