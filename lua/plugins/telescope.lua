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
				mappings = {
					i = {
						['<C-k>'] = require('telescope.actions').move_selection_previous, -- Предыдущий результат
						['<C-j>'] = require('telescope.actions').move_selection_next, -- Следующий результат
						['<C-l>'] = require('telescope.actions').select_default, -- Открыть файл
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

		-- Горячие клавиши
		local builtin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Поиск в хелпе' })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Поиск клавиш' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Поиск файлов' })
		vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Поиск в Telescope' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Поиск слова под курсором' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Grep-поиск' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Поиск диагностики' })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Продолжить поиск' })
		vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Недавние файлы' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Поиск буферов' })

		vim.keymap.set('n', '<leader>/', function()
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = 'Поиск в текущем буфере' })

		vim.keymap.set('n', '<leader>s/', function()
			builtin.live_grep { grep_open_files = true, prompt_title = 'Grep в открытых файлах' }
		end, { desc = 'Grep в открытых файлах' })
	end,
}
