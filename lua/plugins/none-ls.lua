return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim', -- Дополнительные источники для none-ls
    'jayp0521/mason-null-ls.nvim', -- Автоматическая установка зависимостей через Mason
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting -- Настройка форматтеров
    local diagnostics = null_ls.builtins.diagnostics -- Настройка линтеров

    -- Установка форматтеров и линтеров через Mason
    require('mason-null-ls').setup {
      ensure_installed = { -- Список инструментов для автоматической установки
        'prettier', -- Форматтер для TypeScript/JavaScript
        'stylua', -- Форматтер для Lua
        'eslint_d', -- Линтер для TypeScript/JavaScript
        'shfmt', -- Форматтер для shell-скриптов
        'checkmake', -- Линтер для Makefiles
      },
      automatic_installation = true, -- Автоматическая установка недостающих инструментов
    }

    -- Источники для форматирования и диагностики
    local sources = {
      diagnostics.checkmake, -- Линтер для Makefiles
      formatting.prettier.with { -- Форматтер для веб-технологий
        filetypes = { 'html', 'json', 'yaml', 'markdown' },
      },
      formatting.stylua, -- Форматтер Lua-кода
      formatting.shfmt.with { -- Форматтер shell-скриптов
        args = { '-i', '4' }, -- Использовать 4 пробела для отступов
      },
      formatting.terraform_fmt, -- Форматтер для Terraform
      require('none-ls.formatting.ruff').with { -- Форматирование Python через ruff
        extra_args = { '--extend-select', 'I' }, -- Дополнительные аргументы
      },
      require 'none-ls.formatting.ruff_format', -- Форматирование Python (альтернатива)
    }

    -- Группа автокоманд для автоматического форматирования
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    -- Основная настройка none-ls
    null_ls.setup {
      -- debug = true, -- Раскомментировать для отладки (логи :NullLsLog)
      sources = sources, -- Подключенные источники

      -- Автоматическое форматирование при сохранении
      on_attach = function(client, bufnr)
        -- Проверка поддержки форматирования LSP
        if client.supports_method 'textDocument/formatting' then
          -- Очистка старых автокоманд
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }

          -- Создание автокоманды на сохранение файла
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- Синхронное форматирование перед сохранением
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
