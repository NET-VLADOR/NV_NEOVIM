return {
  -- https://github.com/lewis6991/gitsigns.nvim
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Навигация по изменениям
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Перейти к следующему git-изменению (next hunk)' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Перейти к предыдущему git-изменению (prev hunk)' })

      -- Действия с изменениями
      -- Визуальный режим
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Добавить выделение в индекс (stage hunk)' })
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Отменить изменения в выделении (reset hunk)' })

      -- Нормальный режим
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '(Git) Добавить кусок в индекс (stage hunk)' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '(Git) Отменить изменения в куске (reset hunk)' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = '(Git) Добавить весь файл в индекс (stage buffer)' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = '(Git) Отменить все изменения в файле (reset buffer)' })
      map('n', '<leader>hp', gitsigns.preview_hunk_inline, { desc = '(Git) Просмотреть изменения в куске (preview hunk)' })
      map('n', '<leader>hb', gitsigns.blame_line, { desc = '(Git) Показать автора строки (git blame)' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = '(Git) Сравнить с индексом (diff index)' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis '@'
      end, { desc = '(Git) Сравнить с последним коммитом (diff HEAD)' })

      -- Переключатели
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '(Git) Переключить git blame для строки' })
    end,
  },
}
