return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Git: ' .. desc })
      end

      map(']g', function()
        if vim.wo.diff then
          vim.cmd.normal { ']g', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Перейти к следующему git-изменению (next hunk)')

      map('[g', function()
        if vim.wo.diff then
          vim.cmd.normal { '[g', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Перейти к предыдущему git-изменению (prev hunk)')

      map('<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Добавить выделение в индекс (stage hunk)', 'v')
      map('<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Отменить изменения в выделении (reset hunk)', 'v')

      map('<leader>gs', gitsigns.stage_hunk, 'Добавить кусок в индекс (stage hunk)')
      map('<leader>gr', gitsigns.reset_hunk, 'Отменить изменения в куске (reset hunk)')
      map('<leader>gS', gitsigns.stage_buffer, 'Добавить весь файл в индекс (stage buffer)')
      map('<leader>gR', gitsigns.reset_buffer, 'Отменить все изменения в файле (reset buffer)')
      map('<leader>gp', gitsigns.preview_hunk_inline, 'Просмотреть изменения в куске (preview hunk)')
      map('<leader>gb', gitsigns.blame_line, 'Показать автора строки (git blame)')
      map('<leader>gd', gitsigns.diffthis, 'Сравнить с индексом (diff index)')
      map('<leader>gD', function()
        gitsigns.diffthis '@'
      end, 'Сравнить с последним коммитом (diff HEAD)')

      map('<leader>tb', gitsigns.toggle_current_line_blame, 'Переключить git blame для строки')
    end,
  },
}
