return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- Опциональная поддержка изображений в окне предпросмотра: см. `# Preview Mode` подробнее
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- фильтрация с использованием параметров буфера
            bo = {
              -- игнорировать окна с указанными типами файлов
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              -- игнорировать окна с указанными типами буферов
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }
      end,
    },
  },
  config = function()
    -- Определение значков для диагностических ошибок:
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    require('neo-tree').setup {
      close_if_last_window = false, -- Закрывать Neo-tree, если это последнее окно во вкладке
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      -- enable_normal_mode_for_inputs = false,                             -- Включать нормальный режим для диалогов ввода
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- Не заменять окна с указанными типами файлов
      sort_case_insensitive = false, -- Сортировка без учета регистра
      sort_function = nil, -- Кастомная функция сортировки
      -- sort_function = function (a,b)
      --       if a.type == b.type then
      --           return a.path > b.path
      --       else
      --           return a.type > b.type
      --       end
      --   end , -- сортировка файлов и директорий по убыванию
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 1, -- Дополнительный отступ слева
          -- Настройки линий отступов
          with_markers = true,
          indent_marker = '│',
          last_indent_marker = '└',
          highlight = 'NeoTreeIndentMarker',
          -- Настройки для вложенных файлов
          with_expanders = nil, -- Если nil и включено вложение файлов, будут включены экспандеры
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '󰜌',
          folder_empty_open = '󰜌',
          -- Эти настройки используются, если не заданы иконки в nvim-web-devicons
          default = '*',
          highlight = 'NeoTreeFileIcon',
        },
        modified = {
          symbol = '[+]',
          highlight = 'NeoTreeModified',
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = 'NeoTreeFileName',
        },
        git_status = {
          symbols = {
            -- Типы изменений
            added = '', -- Или "✚"
            modified = '', -- Или ""
            deleted = '', -- Только для источника git_status
            renamed = '󰁕', -- Только для источника git_status
            -- Статусы
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
        -- Отключение колонок установкой `enabled = false`
        file_size = {
          enabled = true,
          required_width = 64, -- Минимальная ширина окна для отображения
        },
        type = {
          enabled = true,
          required_width = 122,
        },
        last_modified = {
          enabled = true,
          format = 'relative',
          required_width = 88,
        },
        created = {
          enabled = true,
          format = 'relative',
          required_width = 110,
        },
      },
      -- Глобальные кастомные команды
      commands = {},
      window = {
        position = 'left',
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        -- ГЛОБАЛЬНЫЕ ГОРЯЧИЕ КЛАВИШИ (работают во всех источниках) --
        mappings = {
          ['<space>'] = { -- Переключить папку/файл
            'toggle_node',
            nowait = false, -- Отключить `nowait` при конфликтах комбинаций
          },
          ['<2-LeftMouse>'] = 'open', -- Открыть двойным кликом
          ['<cr>'] = 'open', -- Открыть по Enter
          ['<esc>'] = 'cancel', -- Закрыть предпросмотр или плавающее окно
          ['P'] = { 'toggle_preview', config = { use_float = true } }, -- Предпросмотр с плавающим окном
          ['l'] = 'open', -- Открыть элемент
          ['S'] = 'open_split', -- Открыть в горизонтальном разделении
          ['s'] = 'open_vsplit', -- Открыть в вертикальном разделении
          -- ["S"] = "split_with_window_picker",  -- Альтернатива с выбором окна
          -- ["s"] = "vsplit_with_window_picker", -- Альтернатива с выбором окна
          ['t'] = 'open_tabnew', -- Открыть в новой вкладке
          -- ["<cr>"] = "open_drop",         -- Открыть с выпадением
          -- ["t"] = "open_tab_drop",        -- Открыть в новой вкладке с выпадением
          ['w'] = 'open_with_window_picker', -- Открыть с выбором окна
          ['C'] = 'close_node', -- Закрыть текущий узел
          ['z'] = 'close_all_nodes', -- Свернуть все узлы
          ['a'] = { -- Добавить файл/папку
            'add',
            -- Поддержка шаблонов в стиле BASH: "x{a,b,c}" -> xa,xb,xc
            config = {
              show_path = 'none', -- "none", "relative", "absolute"
            },
          },
          ['A'] = 'add_directory', -- Добавить папку
          ['d'] = 'delete', -- Удалить
          ['r'] = 'rename', -- Переименовать
          ['y'] = 'copy_to_clipboard', -- Копировать в буфер
          ['x'] = 'cut_to_clipboard', -- Вырезать в буфер
          ['p'] = 'paste_from_clipboard', -- Вставить из буфера
          ['c'] = 'copy', -- Копировать (с запросом пути)
          ['m'] = 'move', -- Переместить (с запросом пути)
          ['q'] = 'close_window', -- Закрыть окно Neo-tree
          ['R'] = 'refresh', -- Обновить
          ['?'] = 'show_help', -- Показать справку
          ['<'] = 'prev_source', -- Предыдущий источник (буферы/гит/файлы)
          ['>'] = 'next_source', -- Следующий источник
          ['i'] = 'show_file_details', -- Показать детали файла
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false, -- Показывать скрытые элементы особым стилем
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- Работает только на Windows
          hide_by_name = { -- Скрыть по имени
            '.DS_Store',
            'thumbs.db',
            'node_modules',
            '__pycache__',
            '.virtual_documents',
            '.git',
            '.python-version',
            '.venv',
          },
          hide_by_pattern = { -- Шаблоны для скрытия (стиль glob)
            --"*.meta",
          },
          always_show = { -- Всегда показывать (игнорирует скрытие)
            --".gitignored",
          },
          never_show = { -- Никогда не показывать (игнорирует видимость)
            --".DS_Store",
          },
          never_show_by_pattern = { -- Шаблоны для постоянного скрытия
            --".null-ls_*",
          },
        },
        follow_current_file = {
          enabled = false, -- Авто-фокус на файле активного буфера
          leave_dirs_open = false, -- Закрывать автораскрытые папки
        },
        group_empty_dirs = false, -- Группировать пустые папки
        hijack_netrw_behavior = 'open_default', -- Режим интеграции с netrw
        use_libuv_file_watcher = false, -- Использовать системные файловые наблюдатели
        window = {
          mappings = {
            ['<bs>'] = 'navigate_up', -- Перейти на уровень вверх
            ['.'] = 'set_root', -- Установить текущую папку как корень
            ['H'] = 'toggle_hidden', -- Показать/скрыть скрытые файлы
            ['/'] = 'fuzzy_finder', -- Поиск по файлам
            ['D'] = 'fuzzy_finder_directory', -- Поиск по директориям
            ['#'] = 'fuzzy_sorter', -- Сортировка через fzy
            ['f'] = 'filter_on_submit', -- Фильтр после ввода
            ['<c-x>'] = 'clear_filter', -- Сбросить фильтр
            ['[g'] = 'prev_git_modified', -- Предыдущий измененный в git
            [']g'] = 'next_git_modified', -- Следующий измененный в git
            -- Сортировки:
            ['o'] = { 'show_help', nowait = false, config = { title = 'Сортировать по', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false }, -- Дата создания
            ['od'] = { 'order_by_diagnostics', nowait = false }, -- Диагностикам
            ['og'] = { 'order_by_git_status', nowait = false }, -- Git статусу
            ['om'] = { 'order_by_modified', nowait = false }, -- Изменению
            ['on'] = { 'order_by_name', nowait = false }, -- Имени
            ['os'] = { 'order_by_size', nowait = false }, -- Размеру
            ['ot'] = { 'order_by_type', nowait = false }, -- Типу
          },
          fuzzy_finder_mappings = { -- Клавиши в режиме поиска
            ['<down>'] = 'move_cursor_down',
            ['<C-n>'] = 'move_cursor_down',
            ['<up>'] = 'move_cursor_up',
            ['<C-p>'] = 'move_cursor_up',
          },
        },
        commands = {}, -- Кастомные команды для файловой системы
      },
      buffers = {
        follow_current_file = {
          enabled = true, -- Фокусировать файл активного буфера
          leave_dirs_open = false,
        },
        group_empty_dirs = true, -- Группировать пустые папки
        show_unloaded = true, -- Показывать не загруженные буферы
        window = {
          mappings = {
            ['bd'] = 'buffer_delete', -- Удалить буфер
            ['<bs>'] = 'navigate_up', -- На уровень вверх
            ['.'] = 'set_root', -- Установить корень
            -- Сортировки (аналогично файловой системе):
            ['o'] = { 'show_help', nowait = false, config = { title = 'Сортировать по', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
      git_status = {
        window = {
          position = 'float', -- Плавающее окно
          mappings = {
            ['A'] = 'git_add_all', -- Добавить все изменения
            ['gu'] = 'git_unstage_file', -- Убрать из индекса
            ['ga'] = 'git_add_file', -- Добавить файл в индекс
            ['gr'] = 'git_revert_file', -- Откатить изменения в файле
            ['gc'] = 'git_commit', -- Создать коммит
            ['gp'] = 'git_push', -- Отправить в удаленный репозиторий
            ['gg'] = 'git_commit_and_push', -- Коммит и отправка
            -- Сортировки (аналогично другим разделам):
            ['o'] = { 'show_help', nowait = false, config = { title = 'Сортировать по', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
    }
    -- Пользовательские клавиши для управления Neo-tree
    vim.cmd [[nnoremap \ :Neotree reveal<cr>]] -- Показать Neo-tree с текущим файлом
    vim.keymap.set(
      'n',
      '<leader>e',
      ':Neotree toggle position=left<CR>',
      { noremap = true, silent = true, desc = 'Neotree: переключить видимость' }
    ) -- Переключить файловый эксплорер
  end,
}
