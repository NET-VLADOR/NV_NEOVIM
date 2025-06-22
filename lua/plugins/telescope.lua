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
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        results_title = 'Результат',
        dynamic_preview_title = true,
        mappings = {
          i = {
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-l>'] = require('telescope.actions').select_default,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    local wrapper = function(builtin_func, title)
      return function()
        builtin_func { prompt_title = title }
      end
    end

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { desc = desc })
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

    map('<leader>fh', wrapper(builtin.help_tags, 'Справка'), 'Поиск в справке')
    map('<leader>fk', wrapper(builtin.keymaps, 'Горячие клавиши'), 'Поиск горячих клавиш')
    map('<leader>ff', wrapper(builtin.find_files, 'Файлы'), 'Поиск файлов')
    map('<leader>fs', wrapper(builtin.builtin, 'Telescope'), 'Поиск в Telescope')
    map('<leader>fw', wrapper(builtin.grep_string, 'Слово под курсором'), 'Поиск слова под курсором')
    map('<leader>fg', wrapper(builtin.live_grep, 'Слово'), 'Поиск слова')
    map('<leader>fd', wrapper(builtin.diagnostics, 'Диагностика'), 'Поиск диагностики')
    map('<leader>fb', wrapper(builtin.buffers, 'Буфферы'), 'Поиск буферов')
    map('<leader>f.', wrapper(builtin.oldfiles, 'Недавние файлы'), 'Поиск в недавних файлах')
    map('<leader>fo', live, 'Поиск-Grep в открытых файлах')
    map('<leader>f/', fuzzy, 'Поиск в текущем буфере')
    map('<leader>fr', builtin.resume, 'Продолжить поиск')
  end,
}
