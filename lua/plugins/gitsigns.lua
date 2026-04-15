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

      -- ═══════════════════════════════════════════════════════════
      -- 1. Навигация по изменениям
      -- ═══════════════════════════════════════════════════════════
      map(']g', function()
        if vim.wo.diff then
          vim.cmd.normal { ']g', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Следующее изменение')

      map('[g', function()
        if vim.wo.diff then
          vim.cmd.normal { '[g', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Предыдущее изменение')

      map('<leader>gh', gitsigns.select_hunk, 'Выделить текущий блок')

      -- ═══════════════════════════════════════════════════════════
      -- 2. Управление изменениями (стадия/сброс)
      -- ═══════════════════════════════════════════════════════════
      -- Индивидуальные изменения
      map('<leader>gs', gitsigns.stage_hunk, 'Добавить блок в индекс')
      map('<leader>gr', gitsigns.reset_hunk, 'Отменить изменения в блоке')

      -- Визуальный режим
      map('<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Добавить выделение в индекс', 'v')

      map('<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Отменить изменения в выделении', 'v')

      -- Весь файл
      map('<leader>gS', gitsigns.stage_buffer, 'Добавить файл в индекс')
      map('<leader>gR', gitsigns.reset_buffer, 'Отменить изменения в файле')

      -- ═══════════════════════════════════════════════════════════
      -- 3. Просмотр изменений
      -- ═══════════════════════════════════════════════════════════
      map('<leader>gp', gitsigns.preview_hunk_inline, 'Предпросмотр блока (в строке)')
      map('<leader>gP', gitsigns.preview_hunk, 'Предпросмотр блока (в окне)')
      map('<leader>gd', gitsigns.diffthis, 'Сравнить с индексом')
      map('<leader>gD', function()
        gitsigns.diffthis '@'
      end, 'Сравнить с последним коммитом')
      map('<leader>gb', gitsigns.blame_line, 'Автор строки')
      map('<leader>gB', gitsigns.blame, 'Полная история изменений')

      -- ═══════════════════════════════════════════════════════════
      -- 4. Переключение режимов отображения (группа T — toggle)
      -- ═══════════════════════════════════════════════════════════
      map('<leader>gt', gitsigns.toggle_current_line_blame, 'Переключить blame строки')
      map('<leader>gTs', gitsigns.toggle_signs, 'Переключить знаки изменений')
      map('<leader>gTn', gitsigns.toggle_numhl, 'Переключить подсветку номеров')
      map('<leader>gTl', gitsigns.toggle_linehl, 'Переключить подсветку строк')
      map('<leader>gTw', gitsigns.toggle_word_diff, 'Переключить подсветку слов')
      map('<leader>gTd', gitsigns.toggle_deleted, 'Переключить удалённые строки')

      -- ═══════════════════════════════════════════════════════════
      -- 5. Работа с историей и базой
      -- ═══════════════════════════════════════════════════════════
      map('<leader>gx', function()
        gitsigns.change_base '~'
      end, 'Сменить базу на HEAD~')

      map('<leader>gq', function()
        gitsigns.setqflist 'attached'
      end, 'Показать все изменения')
    end,
  },
}
