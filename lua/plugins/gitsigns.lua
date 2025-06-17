return {
  -- https://github.com/lewis6991/gitsigns.nvim
  'lewis6991/gitsigns.nvim',
  opts = {
    -- Раскомментировать если хочется видеть значки
    -- signs = {
    --   add = { text = '+' },
    --   change = { text = '~' },
    --   delete = { text = '_' },
    --   topdelete = { text = '‾' },
    --   changedelete = { text = '~' },
    -- },
    -- signs_staged = {
    --   add = { text = '+' },
    --   change = { text = '~' },
    --   delete = { text = '_' },
    --   topdelete = { text = '‾' },
    --   changedelete = { text = '~' },
    -- },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Git: ' .. desc })
      end

      -- Навигация по изменениям
      map(']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Перейти к следующему git-изменению (next hunk)')

      map('[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Перейти к предыдущему git-изменению (prev hunk)')

      -- Действия с изменениями
      -- Визуальный режим
      map('<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Добавить выделение в индекс (stage hunk)', 'v')
      map('<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Отменить изменения в выделении (reset hunk)', 'v')

      -- Нормальный режим
      map('<leader>hs', gitsigns.stage_hunk, 'Добавить кусок в индекс (stage hunk)')
      map('<leader>hr', gitsigns.reset_hunk, 'Отменить изменения в куске (reset hunk)')
      map('<leader>hS', gitsigns.stage_buffer, 'Добавить весь файл в индекс (stage buffer)')
      map('<leader>hR', gitsigns.reset_buffer, 'Отменить все изменения в файле (reset buffer)')
      map('<leader>hp', gitsigns.preview_hunk_inline, 'Просмотреть изменения в куске (preview hunk)')
      map('<leader>hb', gitsigns.blame_line, 'Показать автора строки (git blame)')
      map('<leader>hd', gitsigns.diffthis, 'Сравнить с индексом (diff index)')
      map('<leader>hD', function()
        gitsigns.diffthis '@'
      end, 'Сравнить с последним коммитом (diff HEAD)')

      -- Переключатели
      map('<leader>tb', gitsigns.toggle_current_line_blame, 'Переключить git blame для строки')
    end,
  },
}
