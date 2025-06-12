return {
	-- Основная конфигурация LSP
	'neovim/nvim-lspconfig',
	dependencies = {
		-- Автоматическая установка LSP-серверов и инструментов
		{ 'williamboman/mason.nvim', config = true }, -- Должен загружаться первым
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',

		-- Индикация статуса LSP
		{ 'j-hui/fidget.nvim', opts = {} },

		-- Интеграция с автодополнением
		'hrsh7th/cmp-nvim-lsp',
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
				map('gd', require('telescope.builtin').lsp_definitions, 'Перейти к определению')
				map('gr', require('telescope.builtin').lsp_references, 'Найти ссылки')
				map('gI', require('telescope.builtin').lsp_implementations, 'Перейти к реализации')
				map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Тип определения')
				map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Символы документа')
				map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Символы проекта')
				map('<leader>rn', vim.lsp.buf.rename, 'Переименовать')
				map('<leader>ca', vim.lsp.buf.code_action, 'Код-действия', { 'n', 'x' })
				map('gD', vim.lsp.buf.declaration, 'Перейти к объявлению')
				map('<leader>th', function() -- Переключение подсказок
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
				end, 'Подсказки в коде')

				-- Подсветка ссылок при удержании курсора
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
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
				end
			end,
		})

		-- Расширенные возможности для LSP
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		-- Настройки языковых серверов
		local servers = {
			ts_ls = {}, -- TypeScript
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
						completion = { callSnippet = 'Replace' },
						runtime = { version = 'LuaJIT' },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file('', true),
						},
						diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
		}

		-- Настройка Mason для управления LSP-серверами
		require('mason').setup()

		-- Автоматическая установка серверов и инструментов
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			'stylua', -- Форматировщик Lua
		})
		require('mason-tool-installer').setup { ensure_installed = ensure_installed }

		-- Инициализация LSP-серверов
		require('mason-lspconfig').setup {
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
