return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        results_title = false,
        mappings = {
          i = {
            ['<C-k>'] = require('telescope.actions').move_selection_previous, -- Предыдущий результат
            ['<C-j>'] = require('telescope.actions').move_selection_next,     -- Следующий результат
            ['<C-l>'] = require('telescope.actions').select_default,          -- Открыть файл
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          hidden = true, -- Искать скрытые файлы
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          additional_args = function(_)
            return { '--hidden' }
          end, -- Искать в скрытых
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(), -- Выпадающее меню
        },
      },
    }

    -- Подключение расширений
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    local map = function(builtin_func, title)
      return function()
        builtin_func { prompt_title = title }
      end
    end

    local fuzzy = function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end

    local live = function()
      builtin.live_grep { grep_open_files = true, prompt_title = 'Поиск-Grep в открытых файлах' }
    end

    -- Горячие клавиши
    vim.keymap.set('n', '<leader>fh', map(builtin.help_tags, 'Справка'), { desc = 'Поиск в справке' })
    vim.keymap.set('n', '<leader>fk', map(builtin.keymaps, 'Горячие клавиши'), { desc = 'Поиск горячих клавиш' })
    vim.keymap.set('n', '<leader>ff', map(builtin.find_files, 'Найти файл'), { desc = 'Поиск файлов' })
    vim.keymap.set('n', '<leader>fs', map(builtin.builtin, 'Telescope'), { desc = 'Поиск в Telescope' })
    vim.keymap.set('n', '<leader>fw', map(builtin.grep_string, 'Найти слово'), { desc = 'Поиск слова под курсором' })
    vim.keymap.set('n', '<leader>fg', map(builtin.live_grep, 'Grep'), { desc = 'Поиск-Grep' })
    vim.keymap.set('n', '<leader>fd', map(builtin.diagnostics, 'Диагностика'), { desc = 'Поиск диагностики' })
    vim.keymap.set('n', '<leader>fb', map(builtin.buffers, 'Буфферы'), { desc = 'Поиск буферов' })
    vim.keymap.set('n', '<leader>f.', map(builtin.oldfiles, 'Недавние файлы'), { desc = 'Поиск в недавних файлах' })
    vim.keymap.set('n', '<leader>fo', live, { desc = 'Поиск-Grep в открытых файлах' })
    vim.keymap.set('n', '<leader>f/', fuzzy, { desc = 'Поиск в текущем буфере' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Продолжить поиск' })
  end,
}
