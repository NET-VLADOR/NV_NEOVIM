return {
  -- Основная конфигурация LSP
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Автоматическая установка LSP-серверов и инструментов
    { 'williamboman/mason.nvim', config = true }, -- Должен загружаться первым
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    -- Индикация статуса LSP
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- LSP (Language Server Protocol) - протокол для взаимодействия
    -- редактора с языковыми серверами. Обеспечивает:
    -- - Переход к определению
    -- - Поиск ссылок
    -- - Автодополнение
    -- - Анализ кода и др.

    -- Настройка обработчика прикрепления LSP к буферу
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- Вспомогательная функция для создания keymap
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Горячие клавиши:
        map('<leader>ld', require('telescope.builtin').lsp_definitions, 'Перейти к определению')
        map('<leader>lr', require('telescope.builtin').lsp_references, 'Найти ссылки')
        map('<leader>li', require('telescope.builtin').lsp_implementations, 'Перейти к реализации')
        map('<leader>lt', require('telescope.builtin').lsp_type_definitions, 'Тип определения')
        map('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Символы документа')
        map('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Символы проекта')
        map('<leader>ln', vim.lsp.buf.rename, 'Переименовать')
        map('<leader>la', vim.lsp.buf.code_action, 'Код-действия', { 'n', 'x' })
        map('<leader>lD', vim.lsp.buf.declaration, 'Перейти к объявлению')
        map('<leader>th', function() -- Переключение подсказок
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        end, 'Переключить подсказки в коде')

        -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- Подсветка ссылок при удержании курсора
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }
    -- Расширенные возможности для LSP
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Настройки языковых серверов
    local servers = {
      ts_ls = {}, -- TypeScript
      eslint = {},
      html = { filetypes = { 'html', 'twig', 'hbs' } },
      cssls = {}, -- CSS
      tailwindcss = {}, -- Tailwind CSS
      dockerls = {}, -- Docker
      sqlls = {}, -- SQL
      jsonls = {}, -- JSON
      yamlls = {}, -- YAML
      lua_ls = { -- Lua
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }

    -- Автоматическая установка серверов и инструментов
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Форматировщик Lua
      'prettierd',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    -- Инициализация LSP-серверов
    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_enable = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
