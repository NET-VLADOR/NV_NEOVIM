return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs_staged_enable = true,
    word_diff = false,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 500,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author> • <author_time:%R> • <summary>',
    diff_opts = {
      internal = true,
      algorithm = 'histogram',
      ignore_whitespace = false,
      indent_heuristic = true,
    },

    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Git: ' .. desc })
      end

      -- 1. Навигация по изменениям
      map(']g', function()
        if vim.wo.diff then
          vim.cmd.normal { ']g', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Следующее изменение (next hunk)')

      map('[g', function()
        if vim.wo.diff then
          vim.cmd.normal { '[g', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Предыдущее изменение (prev hunk)')

      map('<leader>gh', gitsigns.select_hunk, 'Выделить текущий кусок (select hunk)')

      -- 2. Управление изменениями (стадия/сброс)
      -- Индивидуальные изменения
      map('<leader>gs', gitsigns.stage_hunk, 'Добавить кусок в индекс (stage hunk)')
      map('<leader>gr', gitsigns.reset_hunk, 'Отменить изменения в куске (reset hunk)')

      -- Визуальный режим
      map('<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Добавить выделение в индекс (stage hunk)', 'v')

      map('<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Отменить изменения в выделении (reset hunk)', 'v')

      -- Весь файл
      map('<leader>gS', gitsigns.stage_buffer, 'Добавить весь файл в индекс (stage buffer)')
      map('<leader>gR', gitsigns.reset_buffer, 'Отменить все изменения в файле (reset buffer)')
      map('<leader>gX', gitsigns.reset_buffer_index, 'Сбросить индекс буфера (reset buffer index)')

      -- 3. Просмотр изменений
      map('<leader>gp', gitsigns.preview_hunk_inline, 'Просмотреть изменения в куске (inline preview)')
      map('<leader>gP', gitsigns.preview_hunk, 'Просмотреть кусок во float-окне (float preview)')
      map('<leader>gd', gitsigns.diffthis, 'Сравнить с индексом (diff index)')
      map('<leader>gD', function()
        gitsigns.diffthis '@'
      end, 'Сравнить с последним коммитом (diff HEAD)')
      map('<leader>gb', gitsigns.blame_line, 'Показать автора строки (blame line)')
      map('<leader>gB', gitsigns.blame, 'Открыть blame в новом окне (full blame)')

      -- 4. Переключение режимов отображения
      map('<leader>tb', gitsigns.toggle_current_line_blame, 'Blame для строки (переключить)')
      map('<leader>ts', gitsigns.toggle_signs, 'Знаки изменений (переключить)')
      map('<leader>tn', gitsigns.toggle_numhl, 'Подсветка номеров строк (переключить)')
      map('<leader>tl', gitsigns.toggle_linehl, 'Подсветка строк (переключить)')
      map('<leader>tw', gitsigns.toggle_word_diff, 'Подсветка слов (переключить)')

      -- 5. Работа с историей и базой
      map('<leader>gx', function()
        gitsigns.change_base '~'
      end, 'Сменить базу на HEAD~ (change base)')

      map('<leader>gX', function()
        gitsigns.change_base()
      end, 'Сбросить базу сравнения (reset base)')

      map('<leader>gq', function()
        gitsigns.setqflist 'attached'
      end, 'Показать все изменения в quickfix')
    end,
  },
}
